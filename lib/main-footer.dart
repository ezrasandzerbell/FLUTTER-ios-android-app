import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'sign-up-services.dart';
import 'sign-up-p1.dart';
import 'sign-in-page.dart';

var whiteColor = const Color(0xFFeceff1);
var pinkColor = const Color(0xFFf735e9);



Widget footerLink(String label, Color colorCode, BuildContext context, routeContext) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      new GestureDetector(
        onTap: (){
          switch(routeContext) {
            case "signInPage": {
              Navigator.of(context).pushNamed(signInPage.routeName);
            }
            break;

            case "signUpPage": {
              Navigator.of(context).pushNamed(signUpPageOne.routeName);
            }
            break;

            case "signUpServices": {
              Navigator.of(context).pushNamed(signUpPageServices.routeName);
            }
            break;
          }

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

Widget landingPageFooter(context) {
  return new Container(
    height: 50.0,
    decoration: new BoxDecoration(color: Colors.black),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        footerLink('Already have an account?', whiteColor, context, "signInPage"),
        footerLink('SIGN IN', pinkColor, context, "signInPage"),
      ],
    ),
  );
}

