

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    Column signInLink(String label) {

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFeceff1)
              ),
            ),
          ),
        ],
      );
    }

    Widget bottomNav = new Container(
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


    Widget titleTextSection = new Container(
      padding: const EdgeInsets.only(left: 102.0, right: 102.0, top: 30.0, bottom: 30.0),
        child: new Text(
        ''' Welcome to Style360''',
        softWrap: true,
            textAlign: TextAlign.center,
        style: new TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    Widget subtitleTextSection = new Container(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
      child: new Text(
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet Donec imperdiet.''',
        softWrap: true,
        textAlign: TextAlign.center,
        style: new TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400
        ),
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        body: new ListView(
          padding: const EdgeInsets.only(top: 100.0),
          children: [
            new Image.asset(
              'images/style.png',
              width: 150.0,
              height: 150.0,
            ),
            titleTextSection,
            subtitleTextSection,
            bottomNav,
          ],
        ),
      ),
    );
  }
}

class BaseLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('images/dog.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content content here */,
      ),
    );
  }
}