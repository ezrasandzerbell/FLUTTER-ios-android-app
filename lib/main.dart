import 'package:flutter/material.dart';
import 'my-app-homepage.dart';
import 'sign-up-page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override

    Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      signUpPage.routeName: (BuildContext context) => new signUpPage(title: "signUpPage"),
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyAppHomePage(),
      routes: routes,
    );
  }
}