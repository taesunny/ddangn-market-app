import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sunny_alarm/dto/productlistitemdto.dart';
import 'package:sunny_alarm/screens/productdetail.dart';
import 'package:sunny_alarm/urlconst.dart' as UrlConst;
import 'package:sunny_alarm/utils/dateutil.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductListItemDto> _products = [];

  void _fetchPosts() async {
    final response = await http.get('${UrlConst.API_BASE_URL}/api/v1/products');

    final List<ProductListItemDto> parsedResponse = jsonDecode(
            utf8.decode(response.bodyBytes))
        .map<ProductListItemDto>((json) => ProductListItemDto.fromJSON(json))
        .toList();

    setState(() {
      _products = parsedResponse;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return CustomProductListItemWidget(
          image: Image.network(_products[index].imageFilePath),
          title: _products[index].title,
          status: _products[index].status,
          region: _products[index].region,
          elapsedTime: _products[index].createdTime,
          price: _products[index].price,
          id: _products[index].id,
        );
      },
    );
  }
}

class _ProductListDescription extends StatelessWidget {
  _ProductListDescription({
    Key key,
    this.title,
    this.status,
    this.region,
    this.createdDate,
    this.price,
  }) : super(key: key);

  final String title;
  final String status;
  final String region;
  final DateTime createdDate;
  final int price;

  @override
  Widget build(BuildContext context) {
    String elepsedTime = DateUtil.getElapsedTimeFromNow(createdDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$region - $elepsedTime',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            // alignment: Alignment.bottomRight
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '${price}원',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '$status',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class CustomProductListItemWidget extends StatelessWidget {
  CustomProductListItemWidget(
      {Key key,
      this.image,
      this.title,
      this.status,
      this.region,
      this.elapsedTime,
      this.price,
      this.id})
      : super(key: key);

  final Widget image;
  final String title;
  final String status;
  final String region;
  final DateTime elapsedTime;
  final int price;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductDetail(id)));
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              color: Color.fromRGBO(251, 164, 33, 0.1),
              child: SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.0,
                      child: image,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                        child: _ProductListDescription(
                          title: title,
                          status: status,
                          region: region,
                          // createdDate: createdDate,
                          price: price,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
