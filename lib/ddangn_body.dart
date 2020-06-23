import 'package:flutter/material.dart';
import 'package:sunny_alarm/ddangn_product_list.dart';

class DdangnBody extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Expanded(flex: 1, child: new InstaStories()),
        Flexible(child: DdangnProductList())
      ],
    );
  }
}
