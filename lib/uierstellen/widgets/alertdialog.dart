import 'package:flutter/material.dart';


void addingAlertDialog(BuildContext context){

  AlertDialog alertDialog = AlertDialog(

    title: Text('beenden'),
    content: Text('Möchten Sie die App wirklich beenden?'),
  );
  showDialog(context: context,
      builder: (BuildContext context){
        return alertDialog;
      })
  ;
}
