import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Einstellung.dart';
import 'Model-json.dart';
import 'chat.dart';




void main()  => runApp(
    MaterialApp(
        title : 'Energie App',
        home: Home()));

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
  int _currentIndex = 0;
  final tabs=[
    Center(
      child: Column(
  children: <Widget>[
    Container(
      margin: const EdgeInsets.all(70.0),
      alignment: Alignment.center,
    child:  CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('Images/bot.png'), // Hier Changes 
      ),
    ),
   Text("    Hallo! ich bin Roby\nwas kann ich für Sie tun?",style: TextStyle(color: Colors.teal, fontSize: 25,fontWeight: FontWeight.bold),),
  ],),
  ),
    Center(child: ChatDetails(),),
    Center (child: MyApp()),
    Center(child:info() ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energie-App'),
      ),
      body:tabs[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
          currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
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
        onTap: (index){{
          setState(() {
              _currentIndex = index;
          });
          }
        },

      ),

    );
  }
}
