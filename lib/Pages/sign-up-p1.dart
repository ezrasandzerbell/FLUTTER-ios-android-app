import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../GlobalWidgets/main-footer.dart';
import '../main.dart';

class signUpPageOne extends StatefulWidget {
  @override

  final String title;
  signUpPageOne({Key key, this.title}) : super(key: key);
  static const String routeName = "/signUpPageOne";

  signUpPageOneState createState() {
    return new signUpPageOneState();
  }

}

class signUpPageOneState extends State<signUpPageOne> {

  @override Widget build(BuildContext context) {

    var cameraChild = new Image.asset(
      'images/camera.png',
      width: 130.0,
      height: 130.0,
    );

    Widget cameraIcon = new Container(
      padding: const EdgeInsets.only(top: 70.0, bottom: 50.0),
      child: new GestureDetector(
        onTap: (){
          new CameraApp();
        },
          child: cameraChild,
      )
    );

    Widget formListTitleDefault(arg) {
      return new ListTile(
        title: new Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xFFf735e9), // underline color with focus
            hintColor: Colors.white, // underline color without focus
          ),
          child: new TextField(
            style: new TextStyle(color: const Color(0xFFeceff1)),
            decoration: new InputDecoration(
              hintText: arg,
            ),
          ),
        ),
      );
    }

//    Widget tosAgreeCheckbox() {
//      return new Container (
//          child: new CheckboxListTile(
//            title: new Text('I agree to the Terms and Conditions'),
//            value: true,
//            onChanged: (bool value){
//            }
//
//          )
//      );
//    }

    Widget signUpForm = new Container (
        padding: const EdgeInsets.only(bottom: 50.0),
        child: new Column(
            children: <Widget> [
              formListTitleDefault("Full Name"),
              formListTitleDefault("Email"),
              formListTitleDefault("Password"),
              formListTitleDefault("Confirm Password")
            ]
        )
    );

    Widget backgroundImage = new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/img1.jpg"),
            fit: BoxFit.cover,
          ),
        )
    );

    Widget continueFooterButton = new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.black),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          footerLink('CONTINUE', pinkColor, context,  "signUpServices"),
        ],
      ),
    );

    Widget homePageView = new Scaffold(
      body: new Stack (
          children: <Widget>[
            new PageView(
              children: [backgroundImage],
            ),
            new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: [
                cameraIcon,
                signUpForm
              ],
            ),
          ]
      ),
      bottomNavigationBar: continueFooterButton,
    );
    return homePageView;
  }
}