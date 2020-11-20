import 'dart:async';
import 'package:auth_ui/helperUI/auth_forms.dart';
import 'package:auth_ui/helperUI/background_painter.dart';
import 'package:auth_ui/helperUI/progress_bar.dart';
import 'package:auth_ui/home_page_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginUI extends StatefulWidget {
  static const String id = 'login_ui';
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState.validate()) {
      print('validated');
      setState(() {
        loading = true;
      });
      Timer(Duration(milliseconds: 1000), () {
        Navigator.pushNamed(context, HomePage.id);
        setState(() {
          loading = false;
        });
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // TODO: implement initState
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        //constraints: BoxConstraints(maxWidth: 230.0, maxHeight: 25.0),
        color: Colors.white,
        //color: Colors.white,
        child: Container(
          child: Stack(children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundPainter(
                  animation: _controller,
                ),
              ),
            ),
            Container(
              //color: Colors.white10,
              child: ListView(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          bottom: 100,
                          top: 80,
                        ),
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: double.infinity,
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USERNAME',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              EmailField(
                                email: _email,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'PASSWORD',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              PasswordField(
                                password: _password,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 20),
                                    child: Text('Forgot password?'),
                                  )),
                              SignInBar(
                                  label: 'Sign In',
                                  isLoading: loading ? true : false,
                                  onPressed: validate),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' OR CONNECT WITH ',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      print('google auth');
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.red,
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      size: 22,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {
                                      print('facebook auth');
                                    },
                                    elevation: 2.0,
                                    fillColor: Color.fromRGBO(45, 117, 232, 1),
                                    child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {
                                      print('mobile verification');
                                    },
                                    elevation: 2.0,
                                    fillColor: Color.fromRGBO(50, 82, 167, 1),
                                    child: Icon(
                                      FontAwesomeIcons.mobileAlt,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
