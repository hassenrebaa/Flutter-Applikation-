import 'package:flutter/material.dart';
import 'package:flutterapp/uierstellen/widgets/addingbutton.dart';

import 'images.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

  return  Material(
     child: Scaffold(
        appBar: AppBar(
          title: Text("Energie-ChatApp",
              style: TextStyle(color: Colors.amber,

              fontFamily: 'ComicNeue',
              fontWeight: FontWeight.w700)),
        ),
     body:

       Column(children: <Widget>[

           Container(
            color: Colors.blueGrey,
            margin: EdgeInsets.all(20.0),


            child:AddingButton1(),
                ),

       Container(
         color: Colors.blueGrey,
         margin: EdgeInsets.all(20.0),

         child:AddingButton2(),


       ),

       Container(
         color: Colors.blueGrey,


         child:Kleinbutton(),




       )


     ],
     ),
    )
  );

    throw UnimplementedError();
  }


}
