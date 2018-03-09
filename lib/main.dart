import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel/carousel.dart';

void main() {
  runApp(new MyApp());
}

//
//class MySplashScreen extends StatelessWidget {
//  @override
//
//  Widget build(BuildContext context) {
//    Widget style360Logo = new Container(
//      padding: const EdgeInsets.only(top: 100.0, bottom: 200.0),
//      child: new Image.asset(
//        'images/style.png',
//        width: 180.0,
//        height: 180.0,
//      ),
//    );
//    return style360Logo;
//  }
//
//}

class MyAppHomePage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    Widget style360Logo = new Container(
      padding: const EdgeInsets.only(top: 100.0, bottom: 200.0),
      child: new Image.asset(
        'images/style.png',
        width: 180.0,
        height: 180.0,
      ),
    );

    Widget titleTextSection = new Container(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 300.0, bottom: 20.0),
      child: new Text(
        ''' Welcome to Style360''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFeceff1)
        ),
      ),
    );

    Widget subtitleTextSection = new Container(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
      child: new Text(
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet Donec imperdiet.''',
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFeceff1)
        ),
      ),
    );


    Widget getStartedButton = new Align(
      alignment: const Alignment(0.0, -1.0),
      child: new FlatButton(
        child: new Text (
          "GET STARTED",
          style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFAFAFA),
          ),
        ),
        color: const Color(0xFF424242),
        onPressed: (){
          Navigator.of(context).pushNamed(signUpPage.routeName);
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


    Column existingAccountLink(String label) {

      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFeceff1)
              ),
            ),
          ),
        ],
      );
    }



    Widget footer = new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.black),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          existingAccountLink('Already have an account?'),
          signInLink('SIGN IN'),
        ],
      ),
    );

//    Carousel Widget for on page (not background images)
//
//    Widget testCarousel = new SizedBox(
//      height: 100.0,
//      child: new Carousel(
//        children: [
//          new AssetImage('images/img1.jpg'),
//          new AssetImage('images/img2.jpg')
//        ].map((netImage) => new Image(image: netImage)).toList(),
//      ),
//    );

    Widget testBGCarousel = new SizedBox.expand(
      child: new Carousel(
        children: [
          new AssetImage('images/img1.jpg'),
          new AssetImage('images/img2.jpg'),
          new AssetImage('images/img3.jpg'),
        ].map((bgImg) => new Image(image: bgImg, width: 3000.0, height: 3000.0, fit: BoxFit.cover)).toList(),
      ),
    );

    Widget textCarousel = new SizedBox.expand(
        child: new Carousel(
          children: [
            new ListView(
              children: [
                titleTextSection,
                subtitleTextSection,
              ],
            ),
            new ListView(
              children: [
                titleTextSection,
                subtitleTextSection,
              ],
            ),
            new ListView(
              children: [
                titleTextSection,
                subtitleTextSection,
              ],
            ),
          ].map((carouselTextItem) => carouselTextItem).toList(),
        )
    );

    Widget homePageView = new Scaffold(
      body: new Stack (
          children: <Widget>[
            new PageView(
              children: [testBGCarousel],
            ),

            new PageView(
              children: [textCarousel],
            ),
            new ListView(
              physics: new NeverScrollableScrollPhysics(),
              children: [
                style360Logo,
                getStartedButton,
              ],
            ),
          ]
      ),
      bottomNavigationBar: footer,
    );
    return homePageView;
  }
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

class signUpPage extends StatefulWidget {
  signUpPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/signUpPage";

  final String title;

  @override
  _signUpPageState createState() => new _signUpPageState();
}

/// // 1. After the page has been created, register it with the app routes 
/// routes: <String, WidgetBuilder>{
///   signUpPage.routeName: (BuildContext context) => new signUpPage(title: "signUpPage"),
/// },
///
/// // 2. Then this could be used to navigate to the page.
/// Navigator.pushNamed(context, signUpPage.routeName);
///

class _signUpPageState extends State<signUpPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Add',
        child: new Icon(Icons.add),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
  }
}