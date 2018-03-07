import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel/carousel.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    Widget style360Logo = new Container(
      padding: const EdgeInsets.only(top: 100.0),
      child: new Image.asset(
        'images/style.png',
        width: 180.0,
        height: 180.0,
      ),
    );

    Widget titleTextSection = new Container(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0, top: 30.0, bottom: 20.0),
        child: new Text(
        ''' Welcome to Style360''',
            textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.w500,
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
            fontWeight: FontWeight.w400
        ),
      ),
    );

    Widget getStartedButton() {
      return new Align(
        alignment: const Alignment(0.0, -0.2),
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
          onPressed: () {
            // Perform some action
          },
        ),
      );
    }

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

    Widget testCarousel = new SizedBox(
      height: 240.0,
      child: new Carousel(
        children: [
          new AssetImage('images/img1.jpg'),
          new AssetImage('images/img2.jpg')
        ].map((netImage) => new Image(image: netImage)).toList(),
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/dog.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new ListView(
            children: [
              style360Logo,
              titleTextSection,
              subtitleTextSection,
              testCarousel,
              getStartedButton(),
            ],
          ),
        ),
        bottomNavigationBar: footer,
      ),
    );
  }
}

