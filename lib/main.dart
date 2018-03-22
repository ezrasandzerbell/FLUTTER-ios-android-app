import 'package:flutter/material.dart';
import 'package:sightworks_flutter/Pages/my-app-homepage.dart';
import 'package:sightworks_flutter/Pages/sign-in-page.dart';
import 'package:sightworks_flutter/Pages/sign-up-p1.dart';
import 'package:sightworks_flutter/Pages/sign-up-services.dart';
import 'package:sightworks_flutter/Pages/day-hour-availability.dart';
import 'package:sightworks_flutter/Pages/sign-up-location.dart';
import 'package:sightworks_flutter/Pages/sign-up-almost-done.dart';
import 'package:sightworks_flutter/Pages/full-screen-dialog.dart';
import 'dart:async';
import 'package:camera/camera.dart';


Future main() async{
  cameras = await availableCameras();
  runApp(new MyApp());
}

//camera code starts here

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

// camera code ends here

class MyApp extends StatelessWidget {
  @override

    Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder> {
      signUpPageOne.routeName: (BuildContext context) => new signUpPageOne(title: "signUpPageOne"),
      signInPage.routeName: (BuildContext context) => new signInPage(title: "signInPage"),
      signUpPageServices.routeName: (BuildContext context) => new signUpPageServices(title: "signUpPageServices"),
      dayHourAvailability.routeName: (BuildContext context) => new dayHourAvailability(title: "dayHourAvailability"),
      signUpLocationState.routeName: (BuildContext context) => new signUpLocation(title: "signUpLocation"),
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