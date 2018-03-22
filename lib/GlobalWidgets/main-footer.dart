import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sightworks_flutter/Pages/sign-up-services.dart';
import 'package:sightworks_flutter/Pages/sign-up-register.dart';
import 'package:sightworks_flutter/Pages/sign-in.dart';
import 'package:sightworks_flutter/Pages/day-hour-availability.dart';
import 'package:sightworks_flutter/Pages/sign-up-location.dart';
import 'package:sightworks_flutter/Pages/sign-up-almost-done.dart';
import 'package:sightworks_flutter/Pages/full-screen-dialog.dart';

var whiteColor = const Color(0xFFeceff1);
var pinkColor = const Color(0xFFf735e9);



Widget footerLink(String label, Color colorCode, BuildContext context, routeContext, [stateDataArray]) {
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
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new signUpPageServices(stateDataArray[0]: firstName)
                  );
              );
            }
            break;

            case "dayHourAvailability": {
              Navigator.of(context).pushNamed(dayHourAvailability.routeName);
            }
            break;

            case "signUpLocation": {
              Navigator.of(context).pushNamed(signUpLocation.routeName);
            }
            break;

            case "signUpAlmostDone": {
              Navigator.of(context).pushNamed(signUpAlmostDone.routeName);
            }
            break;

            case "fullScreenDialogue": {
              Navigator.of(context).pushNamed(fullScreenDialogue.routeName);
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

