import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel/carousel.dart';
import 'sign-up-p1.dart';
import 'main-footer.dart';

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
        padding: const EdgeInsets.only(left: 80.0, right: 80.0),
        onPressed: (){
          Navigator.of(context).pushNamed(signUpPageOne.routeName);
        },
      ),
    );

    Widget testBGCarousel = new Container(
      child: new Carousel(
        children: [
          new AssetImage('images/img1.jpg'),
          new AssetImage('images/img2.jpg'),
          new AssetImage('images/img3.jpg'),
        ].map((bgImg) => new Image(image: bgImg, width: 1500.0, height: 1500.0, fit: BoxFit.cover)).toList(),
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
      bottomNavigationBar: footer(context),
    );
    return homePageView;
  }
}