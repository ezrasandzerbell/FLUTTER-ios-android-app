import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This demo is based on
// https://material.google.com/components/dialogs.html#dialogs-full-screen-dialogs

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class DateTimeItem extends StatelessWidget {
  DateTimeItem({ Key key, DateTime dateTime, @required this.onChanged })
      : assert(onChanged != null),
        date = new DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new DefaultTextStyle(
        style: theme.textTheme.subhead,
        child: new Row(
            children: <Widget>[

              new Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: new BoxDecoration(
                      border: new Border(bottom: new BorderSide(color: theme.dividerColor))
                  ),
                  child: new InkWell(
                      onTap: () {
                        showTimePicker(
                            context: context,
                            initialTime: time
                        )
                            .then<Null>((TimeOfDay value) {
                          if (value != null)
                            onChanged(new DateTime(date.year, date.month, date.day, value.hour, value.minute));
                        });
                      },
                      child: new Row(
                          children: <Widget>[
                            new Text('${time.format(context)}'),
                            const Icon(Icons.arrow_drop_down, color: Colors.black54),
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}

class fullScreenDialogue extends StatefulWidget {
  fullScreenDialogue({Key key, this.title}) : super(key: key);
  final String title;
  static const String routeName = "/fullScreenDialogue";
  @override

  fullScreenDialogueState createState() => new fullScreenDialogueState();
}

class fullScreenDialogueState extends State<fullScreenDialogue> {


  DateTime _fromDateTime = new DateTime.now();
  DateTime _toDateTime = new DateTime.now();
  bool _allDayValue = false;
  bool _saveNeeded = false;

  Future<bool> _onWillPop() async {
    if (!_saveNeeded)
      return true;

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return await showDialog<bool>(
      context: context,
      child: new AlertDialog(
          content: new Text(
              'Discard new event?',
              style: dialogTextStyle
          ),
          actions: <Widget>[
            new FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop(false); // Pops the confirmation dialog but not the page.
                }
            ),
            new FlatButton(
                child: const Text('DISCARD'),
                onPressed: () {
                  Navigator.of(context).pop(true); // Returning true to _onWillPop will pop again.
                }
            )
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
          title: const Text('Day of the Week'),
          actions: <Widget> [
            new FlatButton(
                child: new Text('SAVE', style: theme.textTheme.body1.copyWith(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context, DismissDialogAction.save);
                }
            )
          ]
      ),
      body: new Form(
          onWillPop: _onWillPop,
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('From', style: theme.textTheme.caption),
                      new DateTimeItem(
                          dateTime: _fromDateTime,
                          onChanged: (DateTime value) {
                            setState(() {
                              _fromDateTime = value;
                              _saveNeeded = true;
                            });
                          }
                      )
                    ]
                ),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('To', style: theme.textTheme.caption),
                      new DateTimeItem(
                          dateTime: _toDateTime,
                          onChanged: (DateTime value) {
                            setState(() {
                              _toDateTime = value;
                              _saveNeeded = true;
                            });
                          }
                      ),
                    ]
                ),
              ]
                  .map((Widget child) {
                return new Container(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: child
                );
              })
                  .toList()
          )
      ),
    );
  }
}