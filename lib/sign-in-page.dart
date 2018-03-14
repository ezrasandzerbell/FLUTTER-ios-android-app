import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main-footer.dart';

class signInPage extends StatelessWidget {
  signInPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/signInPage";

  final String title;

  @override Widget build(BuildContext context) {
    Widget style360Logo = new Container(
      padding: const EdgeInsets.only(top: 70.0, bottom: 50.0),
      child: new Image.asset(
        'images/style.png',
        width: 130.0,
        height: 130.0,
      ),
    );

    Widget forgotPasswordLink = new Container(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 20.0, bottom: 20.0),
      child: new Text(
        ''' Forgot Password? ''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFf735e9)
        ),
      ),
    );


    Widget signInButton = new Align(
      child: new FlatButton(
        child: new Text (
          "SIGN IN",
          style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFAFAFA),
          ),
        ),
        color: const Color(0xFF424242),
        padding: const EdgeInsets.only(left: 100.0, right: 100.0),
        onPressed: (){
          Navigator.of(context).pushNamed(signInPage.routeName);
        },
      ),
    );


    Column signInLink(String label) {

      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFf735e9)
              ),
            ),
          ),
        ],
      );
    }





    var formThemeDefault = Theme.of(context).copyWith(
      primaryColor: const Color(0xFFf735e9), // underline color with focus
      hintColor: Colors.white, // underline color without focus
    );

    Widget formTextFieldDefault(arg) {
      return new Theme(
        data: formThemeDefault,
        child: new TextField(
          style: new TextStyle(color: const Color(0xFFeceff1)),
          decoration: new InputDecoration(
            hintText: arg,
          ),
        ),
      );
    };

    Widget signInForm = new Container (
        padding: const EdgeInsets.only(bottom: 50.0),
        child: new Column(
            children: <Widget> [
              new ListTile(
                title: formTextFieldDefault("Email")
              ),
              new ListTile(
                title: formTextFieldDefault("Password")
              ),
            ]
        )
    );




    Widget backgroundImage = new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/img1.jpg"),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.srcATop),
            fit: BoxFit.cover,
          ),
        )
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
                style360Logo,
                signInForm,
                signInButton,
                forgotPasswordLink
              ],
            ),
          ]
      ),
      bottomNavigationBar: footer(context),
    );
    return homePageView;
  }
}