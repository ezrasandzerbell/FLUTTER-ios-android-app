import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'sign-in-page.dart';

var whiteColor = const Color(0xFFeceff1);
var pinkColor = const Color(0xFFf735e9);

Widget footerLink(String label, Color colorCode, BuildContext context) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      new GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(signInPage.routeName);
        },
        child: new Container(
          child: new Text(
            label,
            style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: colorCode
            ),
          ),
        ),
      ),
    ],
  );
}

Widget footer(context) {
  return new Container(
    height: 50.0,
    decoration: new BoxDecoration(color: Colors.black),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        footerLink('Already have an account?', whiteColor, context),
        footerLink('SIGN IN', pinkColor, context),
      ],
    ),
  );
}

