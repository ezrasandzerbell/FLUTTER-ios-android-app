import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


Widget fullWidthButton(String label, Color colorCode, BuildContext context, routeContext, [availabilityHours]) {

  return new Container(
    height: 50.0,
    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
    decoration: new BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: const Border(
          top: const BorderSide(width: 1.0, color: Colors.grey),
          bottom: const BorderSide(width: 1.0, color: Colors.grey),
        ),
    ),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new GestureDetector(
              onTap: (){
                showModalBottomSheet<Null>(context: context, builder: (BuildContext context) {
                  return new Container(
                    height: 500.0,
                      child: new Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: new Text('This is the modal bottom sheet. Click anywhere to dismiss.',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 24.0
                              )
                          )
                      )
                  );
                });
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
        ),

      ],
    ),
  );
}

