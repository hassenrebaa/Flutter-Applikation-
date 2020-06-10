/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox1 extends StatefulWidget {
  CustomCheckbox({Key key, this.title}) : super(key: key);
  final String title;
  @override
  CheckboxWidget createState() => new CheckboxWidget();
}

class CheckboxWidget1 extends State<CustomCheckbox> {
  String t="Ich akzeptiere die oben genannten \n Datenschutzhinweise";
  bool checkBoxState=false;
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(

      bottomNavigationBar: new ButtonBar (
        children:[
         Text(
           "Impressum\n Chatbot-app\n V.1.1.0\n Entwecklet von:\nBensouda Hanae\nAzlouk Mohamed Yassine\nRebaa Hassen\nMorchid Abdelhamid\n\n\n"
               "Die Betreiber dieser App nehmen den Schutz Ihrer persönlichen Daten sehr ernst. Wir behandeln Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Datenschutzvorschriften sowie dieser Datenschutzerklärung."
         ),
          new Container(
              child: Row(
                children: <Widget>[

                  new Checkbox(
                      onChanged: (bool e) => something() ,
                      value: checkBoxState),
                  new Text(t),

                ], )
          ),

          new Container(
            margin: const EdgeInsets.only(top: 10,left: 40,right: 30) ,
            child: CupertinoButton(
              child: Text("Dantenschutzabstimung"),
              onPressed: (){
                if(checkBoxState==true)
                  showAlertDialog2(context) ;
                else
                  showAlertDialog(context) ;
              },
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),

          ),],
      ),
    );
  }

  void  something () {
    setState((){
      if(checkBoxState) {
        t= "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
        checkBoxState= ! checkBoxState;

      }
      else{
        t= "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
        checkBoxState = !checkBoxState;
      }
    }
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
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
      onPressed: () { },
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
}

 */