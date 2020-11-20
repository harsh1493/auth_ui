import 'package:auth_ui/models/user_credentials.dart';
import 'package:flutter/cupertino.dart';

class UserList extends ChangeNotifier {
  List<UserCredentials> userList = [
    UserCredentials(email: 'abc@gmail.com', password: '123456'),
    UserCredentials(email: 'abcd@gmail.com', password: '123456'),
    UserCredentials(email: 'abcdef@gmail.com', password: '123456'),
  ];

  String addUser({String email, String password}) {
    final newUser = UserCredentials(email: email, password: password);
    bool userExists = false;
    notifyListeners();
    for (var user in userList) {
      if (user.email == email) {
        return 'User already exists';
      } else {
        userExists = true;
      }
    }
    if (userExists) {
      userList.add(newUser);
      return 'noError';
    }
  }

  String signIn({String email, String password}) {
    bool userExists = true;
    for (var user in userList) {
      if (user.email == email) {
        if (user.password == password) {
          return 'noError';
        }
        return 'Invalid Password';
      } else {
        userExists = false;
      }
    }
    if (!userExists) {
      return 'User does not exist';
    }
  }

  int userCount() {
    return userList.length;
  }
}
