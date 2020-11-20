import 'package:auth_ui/auth_ui/splash_screen.dart';
import 'package:auth_ui/home_page_ui.dart';
import 'package:flutter/material.dart';
import 'auth_ui/login_ui.dart';
import 'auth_ui/onboarding_page.dart';
import 'auth_ui/signup_ui.dart';
import 'auth_ui/welcome_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          accentColor: Colors.red,
          unselectedWidgetColor: Colors.red,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
                headline6: TextStyle(color: Colors.black, fontSize: 20)),
            color: Colors.white,
          ),
          colorScheme: ColorScheme.light(background: Colors.white)),
      initialRoute: SplashScreen1.id,
      routes: {
        SplashScreen1.id: (context) => SplashScreen1(),
        OnboardingPage.id: (context) => OnboardingPage(),
        WelcomeUi.id: (context) => WelcomeUi(),
        LoginUI.id: (context) => LoginUI(),
        SignupUI.id: (context) => SignupUI(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}
