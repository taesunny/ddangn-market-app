import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunny_alarm/dto/productdetaildto.dart';
import 'package:http/http.dart' as http;
import 'package:sunny_alarm/urlconst.dart' as UrlConst;
import 'package:sunny_alarm/utils/dateutil.dart';

class ProductDetail extends StatefulWidget {
  final int productId;

  ProductDetail(this.productId, {Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductDetailDto _product;

  void _fetchPosts() async {
    final response = await http
        .get('${UrlConst.API_BASE_URL}/api/v1/products/${widget.productId}');

    final ProductDetailDto parsedResponse =
        ProductDetailDto.fromJSON(jsonDecode(utf8.decode(response.bodyBytes)));

    setState(() {
      _product = parsedResponse;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    String elepsedTime = (_product == null)
        ? "Loading..."
        : DateUtil.getElapsedTimeFromNow(_product.createdTime);

    return (_product == null
        ? (Text('Loading...'))
        : (Scaffold(
            appBar: AppBar(
              title: Text('${_product.title}'),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Image.network('${_product.imageFilePath}'),
                  flex: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${_product.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text(
                        '${_product.region} - $elepsedTime',
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
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${_product.price}원',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '${_product.status}',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ))),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${_product.content}${_product.content}',
                            style: const TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                        ],
                      ),
                    )),
              ],
            ),
          )));
  }
}
