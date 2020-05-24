// Flutter code sample for Expanded

// This example shows how to use an [Expanded] widget in a [Column] so that
// it's middle child, a [Container] here, expands to fill the space.
//
// ![This results in two thin blue boxes with a larger amber box in between.](https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_column.png)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Impressum'),
      ),
      body: Center(
        child: ListView(
            children: <Widget>[
                Container(
               margin: const EdgeInsets.only(top:20),
                  alignment: Alignment.center,
                child: Text("Chatbot-app\nV.1.1.0\nEntwecklet von:\nBensouda Hanae\nAzlouk Mohamed Yassine\nRebaa Hasse\nMorchid Abdelhamid",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30.0),
             alignment: Alignment.center,
             child: Text(" Datenschuzterklärung\n", style: TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
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
                  , style: TextStyle(color: Colors.lightBlueAccent,
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
              ), ],),

      ),
    );
  }
}






