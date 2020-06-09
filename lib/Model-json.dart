import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class info extends StatelessWidget {

  // This widget is the root of your application.
  @override
  bool isSwitched =false ;
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
        child:
        ListView(
  children: <Widget>[
  Container(
  margin: const EdgeInsets.only(top: 30.0),
  alignment: Alignment.center,
  child: Text('Impressum\n',style: TextStyle(
  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),),
  Container(
  margin: const EdgeInsets.only(top:20,left: 50),
  child: Text("Chatbot-app\nV.1.1.0\nEntwecklet von:\nBensouda Hanae\nAzlouk Mohamed Yassine\nRebaa Hassen\nMorchid Abdelhamid",
  style: TextStyle(color: Colors.black54, fontSize: 15),
  ),
  ),
  Container(
  margin: const EdgeInsets.only(top: 30.0),
  alignment: Alignment.center,
  child: Text(" Datenschuzterklärung\n", style: TextStyle(
  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  ),

  Container(
  margin: const EdgeInsets.only(left: 20.0, right: 20),
  alignment: new FractionalOffset(1.0, 0.0),
  child: Text(
  "Die Betreiber dieser App nehmen den Schutz Ihrer persönlichen Daten sehr ernst. Wir behandeln Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Datenschutzvorschriften sowie dieser Datenschutzerklärung."
  "Wenn Sie diese App benutzen, werden verschiedene personenbezogene Daten erhoben. Personenbezogene Daten sind Daten, mit denen Sie persönlich identifiziert werden können. Die vorliegende Datenschutzerklärung erläutert, "
  "welche Daten wir erheben und wofür wir sie nutzen. Sie erläutert auch, wie und zu welchem Zweck das geschieht."
  "Wir weisen darauf hin, dass die Datenübertragung im Internet (z.B. bei der Kommunikation per E-Mail) Sicherheitslücken aufweisen kann. Ein lückenloser Schutz der Daten vor dem Zugriff durch Dritte ist nicht möglich."
  , style: TextStyle(color: Colors.black45,
  fontSize: 20),),
  ),
  Container(
  margin: const EdgeInsets.only(top: 20,left: 50,right: 50) ,
  child: CupertinoButton(
  child: Text("Dantenschutzabstimung"),
  onPressed: (){
  print("ok");
  },
  color: Colors.green,
  borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  ),
  ],
  ),
    ),
    );}
}