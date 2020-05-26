import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Home());

/// This Widget is the main application widget.
class Home extends StatefulWidget {
  @override
  _HomeState createState() =>_HomeState();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }

}
class _HomeState extends State<Home>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impressum'),
      ),
      body: Container(),
      bottomNavigationBar:BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text('Settings'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Info'),
            backgroundColor: Colors.lightBlueAccent,

          )
        ],
      ),
    );
  }
}