import 'dart:math';

import 'package:auth_ui/auth_ui/welcome_ui.dart';
import 'package:auth_ui/data/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page_ui';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int random() {
    Random rnd = new Random();
    int s = 1 + rnd.nextInt(4);
    print(s);
    return s;
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to logout '),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  Navigator.pushNamedAndRemoveUntil(
                      context, WelcomeUi.id, (r) => false);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: Provider.of<UserList>(context).userCount(),
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/user_avatars/user${random()}.png'),
                    ),
                    title: Text(
                        ' ${Provider.of<UserList>(context).userList[index].email}'),
                  ),
                ));
              }),
        ),
      ),
    );
  }
}
