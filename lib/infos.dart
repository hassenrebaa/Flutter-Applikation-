import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FlutterDemo extends StatefulWidget {
  FlutterDemo({Key key}) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter;
  String t = "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
  bool checkBox = false;
  bool checkBoxState1 = true;
  bool _isChecked = true;
  @override
  void initState() {
    super.initState();
    _readCounter().then((int value) {
      setState(() {
        _counter = value;

      });
    });
  }

  Future<String> get localPath1 async {
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }

  Future<File> get _getLocalFile async {
    final file = await localPath1;
    return new File('$file/dataxyyx7.txt');
  }


  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile;
      // read the variable as a string from the file.
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // write the variable as a string to the file
    await (await _getLocalFile).writeAsString('$_counter');
  }
  final String _kNotificationsPrefs = "allowNotifications";
  final String _kSortingOrderPrefs = "sortOrder";

  /// ------------------------------------------------------------
  /// Method that returns the user decision to allow notifications
  /// ------------------------------------------------------------
  Future<bool> getAllowsNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kNotificationsPrefs) ?? false;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision to allow notifications
  /// ----------------------------------------------------------
  Future<bool> setAllowsNotifications(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kNotificationsPrefs, value);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision on sorting order
  /// ------------------------------------------------------------
  Future<String> getSortingOrder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kSortingOrderPrefs) ?? 'name';
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setSortingOrder(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kSortingOrderPrefs, value);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: _counter == 0?
      Center(
        child:
        ListView(
          children: <Widget>[
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
                child: Row(
                  children: <Widget>[

                    new Checkbox(

                      onChanged: (bool value){
                        setState(() =>
                          this.checkBox = value);
                        setAllowsNotifications(value);

                        },

                        value:checkBox,

                      ),



                    Text("$t"),
                  ],
                )
            ),


            Container(
              margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: CupertinoButton(
                child: Text("Dantenschutzabstimung"),
                onPressed: () {
                  _incrementCounter();
                  print(_counter);
                  if (_counter == 1&&checkBox==true) {
                    _isChecked= !_isChecked;
                    showAlertDialog(context);
                  }
                  else {

                  }
                },
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ],
        ),
      ): Center(

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
            Text("Hallo! ich bin Roby\nwas kann ich für Sie tun?",style: TextStyle(color: Colors.teal, fontSize: 25,fontWeight: FontWeight.bold),),
          ],),
      )


    );
  }

  void showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Vielen Dank!"),
      content: Text("Sie haben die Datenschutz abgestimmt !"),
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
  void showAlertDialog1(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Achtung!"),
      content: Text("bitte akzeptieresie  die oben genannten Datenschutzhinweise "),
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
