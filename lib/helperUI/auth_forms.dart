import 'package:auth_ui/helper_functions/validations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailField extends StatefulWidget {
  final TextEditingController email;

  EmailField({@required this.email});
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool error = true;
  bool edited = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.email,
      onChanged: (value) {
        setState(() {
          edited = true;
          if (validateEmail(value) != null) {
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
      decoration: new InputDecoration(
        suffixIcon: Visibility(
          visible: edited,
          child: Icon(
            error ? FontAwesomeIcons.exclamation : Icons.check,
            size: error ? 15 : 25,
            color: error ? Colors.red : Colors.blue,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.black,
        ),
        errorText: edited ? validateEmail(widget.email.text) : null,
        hintText: 'Enter your email',
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.grey,
        ),
      ),
      validator: validateEmail,
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController password;
  PasswordField({@required this.password});
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool h1 = true;
  bool error = true;
  bool edited = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.password,
      onChanged: (value) {
        setState(() {
          edited = true;
          if (validatePassword(value) != null) {
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
      obscureText: h1 ? true : false,
      decoration: new InputDecoration(
        suffixIcon: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Visibility(
                visible: edited,
                child: Icon(
                  error ? FontAwesomeIcons.exclamation : Icons.check,
                  size: error ? 15 : 25,
                  color: error ? Colors.red : Colors.blue,
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  !h1 ? Icons.remove_red_eye : FontAwesomeIcons.solidEyeSlash,
                  size: !h1 ? 20 : 15,
                ),
                onPressed: () {
                  setState(() {
                    h1 = !h1;
                  });
                }),
          ],
        ),
        hintText: 'Enter your password',
        errorText: edited ? validatePassword(widget.password.text) : null,
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      validator: validatePassword,
    );
  }
}
