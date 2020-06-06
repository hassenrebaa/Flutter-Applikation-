import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomCheckbox extends StatefulWidget {
  @override
  CheckboxWidget createState() => new CheckboxWidget();
}

class CheckboxWidget extends State {

  bool isChecked = true;

  var checkedResult = 'Checkbox is CHECKED';



  bool satVal = false;

  Widget checkbox(String title, bool boolValue) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (value){toggleCheckbox(value);},
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                // margin: const EdgeInsets.only(left: 20.0, right: 20),
                //alignment: new FractionalOffset(1.0, 0.0),
                child: Text(
                  "Die Betreiber dieser App nehmen den Schutz Ihrer persönlichen Daten sehr ernst. Wir behandeln Ihre personenbezogenen Daten vertraulich und entsprechend der gesetzlichen Datenschutzvorschriften sowie dieser Datenschutzerklärung."
                      "Wenn Sie diese App benutzen, werden verschiedene personenbezogene Daten erhoben. Personenbezogene Daten sind Daten, mit denen Sie persönlich identifiziert werden können. Die vorliegende Datenschutzerklärung erläutert, "
                      "welche Daten wir erheben und wofür wir sie nutzen. Sie erläutert auch, wie und zu welchem Zweck das geschieht."
                      "Wir weisen darauf hin, dass die Datenübertragung im Internet (z.B. bei der Kommunikation per E-Mail) Sicherheitslücken aufweisen kann. Ein lückenloser Schutz der Daten vor dem Zugriff durch Dritte ist nicht möglich."
                  , style: TextStyle(color: Colors.black45,
                    fontSize: 15),),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  checkbox("Ich akzeptiere die oben genannten Datenschutzhinweise", satVal),


                ],
              ),
              InkWell(
                // margin: const EdgeInsets.only(top: 20,left: 50,right: 50) ,
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
        )
    );
  }
  void toggleCheckbox(bool value) {
    bool isChecked = true;

    var checkedResult = 'Checkbox is CHECKED';

    if(isChecked == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        checkedResult = 'Checkbox is CHECKED';
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        checkedResult = 'Checkbox is UN-CHECKED';
      });
    }
  }}
