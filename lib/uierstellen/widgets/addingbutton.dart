import 'package:flutter/material.dart';

import 'alertdialog.dart';


class AddingButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 130.0, child: RaisedButton(
      child: Text('Zum Chatten',
          style: TextStyle(color: Colors.amber, fontSize: 20.0,

        fontFamily: 'ComicNeue',)),

      elevation: 7.0,
      color: Colors.deepPurple,
      onPressed: () {

      },),
      margin: EdgeInsets.all(10.0),
    );

  }
}

class AddingButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 200.0,
      height: 130.0, child: RaisedButton(
      child: Text('Über Energie-App',
          style: TextStyle(color: Colors.amber, fontSize: 20.0,
              fontFamily: 'ComicNeue')),
      elevation: 7.0,
      color: Colors.deepPurple,
      onPressed: () {

      },),
    );
  }
}



class Kleinbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      width: 75.0,
      height: 30.0, child: RaisedButton(
      child: Text('Beenden',
          style: TextStyle(color: Colors.white, fontSize: 10.0)),

      color: Colors.black,
      onPressed: () {
        addingAlertDialog(context);
      },),

    );

  }
}