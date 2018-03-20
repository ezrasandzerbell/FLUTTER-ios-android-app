import 'package:flutter/material.dart';
import 'my-app-homepage.dart';
import 'sign-in-page.dart';
import 'sign-up-p1.dart';
import 'sign-up-services.dart';
import 'day-hour-availability.dart';
import 'sign-up-location.dart';
import 'sign-up-almost-done.dart';
import 'full-screen-dialog.dart';
import 'dart:async';
import 'package:camera/camera.dart';


Future main() async{
  cameras = await availableCameras();
  runApp(new MyApp());
}

List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => new _CameraAppState();
}

class _CameraAppState extends State {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.initialized) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new CameraPreview(controller));
  }
}



class MyApp extends StatelessWidget {
  @override

    Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      signUpPageOne.routeName: (BuildContext context) => new signUpPageOne(title: "signUpPageOne"),
      signInPage.routeName: (BuildContext context) => new signInPage(title: "signInPage"),
      signUpPageServices.routeName: (BuildContext context) => new signUpPageServices(title: "signUpPageServices"),
      dayHourAvailability.routeName: (BuildContext context) => new dayHourAvailability(title: "dayHourAvailability"),
      signUpLocation.routeName: (BuildContext context) => new signUpLocation(title: "signUpLocation"),
      signUpAlmostDone.routeName: (BuildContext context) => new signUpAlmostDone(title: "signUpAlmostDone"),
      fullScreenDialogue.routeName: (BuildContext context) => new fullScreenDialogue(title: "fullScreenDialogue"),
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyAppHomePage(),
      routes: routes,
    );
  }
}