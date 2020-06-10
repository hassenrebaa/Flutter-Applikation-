import 'package:flutter/material.dart';

import 'LoginPageState.dart';





class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  bool isSwitched =false ;
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title:Text('Benachrichtigung'),
                      leading: Icon(Icons.settings, color:Colors.blue,),),),



                  Container(



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
                ],
              ),
            ),



            Container(
              child:ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  },
                  leading: Icon(Icons.person_add , color:Colors.blue),
                  title: Text("Konto-hinzufügen") // Hier Änderung Hassens
              ),
              alignment: Alignment.bottomLeft,



            ),






          ],
        ),
      ),
    );





  }
}