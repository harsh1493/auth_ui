import 'dart:async';

import 'package:auth_ui/helperUI/auth_forms.dart';
import 'package:auth_ui/helperUI/background_painter.dart';
import 'package:auth_ui/helperUI/progress_bar.dart';
import 'package:auth_ui/helper_functions/validations.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_page_ui.dart';

class SignupUI extends StatefulWidget {
  static const String id = 'signup_ui';
  @override
  _SignupUIState createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _confirmPassword = new TextEditingController();
  bool h2 = true;
  bool error = true;
  bool edited = false;
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState.validate()) {
      print('validated');
      setState(() {
        loading = true;
      });
      Navigator.pushNamed(context, HomePage.id);
      Timer(Duration(milliseconds: 1000), () {
        setState(() {
          loading = false;
        });
      });
    } else {
      print('error');
    }
  }

  String validateConfirm(value) {
    if (value.isEmpty) {
      return '*required';
    } else if (value.toString() != _password.text) {
      return "password don't match";
    } else {
      return null;
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
      body: Builder(
        builder: (context) => DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          child: Container(
            //constraints: BoxConstraints(maxWidth: 230.0, maxHeight: 25.0),
            color: Colors.white,
            //color: Colors.white,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: CustomPaint(
                    painter: BackgroundPainter(
                      animation: _controller,
                    ),
                  ),
                ),
                ListView(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 50, bottom: 80, top: 50),
                          child: Text(
                            'Create An Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'CONFIRM PASSWORD',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                TextFormField(
                                  controller: _confirmPassword,
                                  onChanged: (value) {
                                    setState(() {
                                      edited = true;
                                      if (validateConfirm(value) != null) {
                                        error = true;
                                      } else {
                                        error = false;
                                      }
                                      // widget.notify();
                                    });
                                  },
                                  maxLengthEnforced: false,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  obscureText: h2,
                                  decoration: new InputDecoration(
                                    suffixIcon: Wrap(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Visibility(
                                            visible: edited,
                                            child: Icon(
                                              error
                                                  ? FontAwesomeIcons.exclamation
                                                  : Icons.check,
                                              size: error ? 15 : 25,
                                              color: error
                                                  ? Colors.red
                                                  : Colors.blue,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              !h2
                                                  ? Icons.remove_red_eye
                                                  : FontAwesomeIcons
                                                      .solidEyeSlash,
                                              size: !h2 ? 20 : 15,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                h2 = !h2;
                                              });
                                            }),
                                      ],
                                    ),
                                    errorText: edited
                                        ? validateConfirm(_confirmPassword.text)
                                        : null,
                                    hintText: 'Enter your password again',
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: validateConfirm,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SignUpBar(
                                    label: 'Sign Up',
                                    isLoading: loading ? true : false,
                                    onPressed: validate)
                              ],
                            ),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
