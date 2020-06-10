import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
Future<String> get localPath async{
  final path = await getApplicationDocumentsDirectory();
  return path.path;
}

Future<File> get localFile  async{
  final file = await localPath;
  return new File('$file/data1.txt');
}


Future<File> writeData(String value)  async{
  final file = await localFile;
  return file.writeAsString('$value');
}

Future<String> readData() async {
  try {
    final file = await localFile;
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return 'error: empty file';
  }
}

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({Key key, this.title}) : super(key: key);
  final String title;


  @override
  CheckboxWidget createState() => new CheckboxWidget();
}

class CheckboxWidget extends State<CustomCheckbox> {
  String t = "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
  bool checkBoxState = false;
  bool checkBoxState1 = true ;
  bool isok =true ;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      bottomNavigationBar: new ButtonBar (
        children: [
          Text(
              "Impressum\n Chatbot-app\n V.1.1.0\n Entwecklet von:\nBensouda Hanae\nAzlouk Mohamed Yassine\nRebaa Hassen\nMorchid Abdelhamid\n\n\n"
                  "Die Betreiber dieser App nehmen den Schutz Ihrer persönlichen Daten sehr ernst. Wir behandeln Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Datenschutzvorschriften sowie dieser Datenschutzerklärung."
          ),

          new Container(
              child: Row(
                children: <Widget>[

                  new  Container(
                    child:
                    new  Checkbox(
                      value: checkBoxState1,
                      onChanged: (value){
                        setState(() {
                          test().toString()!="" ? checkBoxState=value : checkBoxState;

                        });
                      },

                    ),),
                  Text(t) ,


                ],)
          ),

          new Container(
            margin: const EdgeInsets.only(top: 10, left: 40, right: 30),
            child: CupertinoButton(
              child: Text("Dantenschutzabstimung"),

              onPressed: () {


                if (checkBoxState == true && (test()==false)) {
                  showAlertDialog2(context);
                  writeData("save");
                  print('saved !');
                  isok=false;
                }
                else if(checkBoxState == true && (test()==true))
                {
                  showAlertDialog3(context);
                  print("nein !!! ") ;

                }
                else if (checkBoxState == false && (test()==true))
                {
                  showAlertDialog3(context);
                }
                else
                  showAlertDialog(context);

              },
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),

          ),
        ],
      ),
    );
  }

  void something() {
    setState(() {
      if (checkBoxState) {
        t = "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
        checkBoxState = !checkBoxState;
      }
      else {
        t = "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
        checkBoxState = !checkBoxState;
      }
    }
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Achtung"),
      content: Text("Stimmen Sie bitte die Datenschützung zu !"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showAlertDialog2(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hinweis"),
      content: Text("Dankeschön Viel Spaß mit Ihre App"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showAlertDialog3(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hinweis"),
      content: Text("Sie haben Schon das Datenschutzung zugestimmt !!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool test() {
    if(readData().toString()!="")
    {

      showAlertDialog3(context);
      return true ;
    }
    return false ;
  }
}