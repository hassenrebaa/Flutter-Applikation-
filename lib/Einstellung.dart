import 'dart:ui';

import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  bool isSwitched =false ;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot-App',
      home: Scaffold(

        appBar: AppBar(
          leading: Icon(Icons.keyboard_return),
          title: Text('Einstellung'),
        ),
        body: Center(
            child: new ListView(
              children: <Widget>[
                //new Container (child: new DrawerHeader(child: new CircleAvatar()),color: Colors.tealAccent,),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Sicherheit'),
                    leading: Icon(Icons.security),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Profilbild ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Benutzername ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Passwort  ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Benachrichtigung'),
                    leading: Icon(Icons.settings, color:Colors.blue,),



                  ),
                ),

                new Container(

                  padding:EdgeInsets.all(8.0) ,
                  margin: EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child:Switch (
                    value: isSwitched,
                    onChanged: (value){
                      isSwitched =value;
                      print(isSwitched);
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ),
                new Container(
                  child:ListTile(
                    leading: Icon(Icons.person_add , color:Colors.blue),
                  ),
                  alignment: Alignment.bottomLeft,
                ),




              ],
            )
        ),

      ),

    );






  }
}







