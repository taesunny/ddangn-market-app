import 'package:flutter/material.dart';
import 'package:sunny_alarm/screens/ProductRegister.dart';
import 'package:sunny_alarm/screens/home.dart';
import 'package:sunny_alarm/screens/productdetail.dart';
import 'package:sunny_alarm/screens/productlist.dart';
import 'package:sunny_alarm/screens/productnoti.dart';
import 'package:sunny_alarm/screens/userinfo.dart';
import 'package:sunny_alarm/user/login.dart';

class DangnBottomAppBarItem {
  DangnBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class DdangnFrame extends StatefulWidget {
  final List<DangnBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;

  DdangnFrame({Key key, this.items, this.onTabSelected}) : super(key: key);

  @override
  _DdangnFrameState createState() => _DdangnFrameState();
}

class _DdangnFrameState extends State<DdangnFrame> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home(),
    ProductList(),
    ProductRegister(),
    ProductNotification(),
    UserInfo()
  ];
  void _onTap(int index) {
    setState(() {
      if (index == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductRegister()));
      } else {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xfff8faf8),
          centerTitle: true,
          elevation: 1.0,
          leading: new Icon(Icons.camera_alt),
          title: SizedBox(
              height: 80.0,
              child: Image.asset("assets/images/ddangn-market-logo1.jpeg")),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogIn()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.account_circle),
                ))
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('List'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_add),
                title: Text('Register'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active),
                title: Text('My Noti'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('My Info'),
              )
            ]));
  }
}
