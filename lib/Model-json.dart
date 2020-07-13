import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FlutterDemo1 extends StatefulWidget {
  FlutterDemo1({Key key}) : super(key: key);

  @override
  _FlutterDemo1State createState() => new _FlutterDemo1State();
}

class _FlutterDemo1State extends State<FlutterDemo1> {
  int _counter;
  String t = "Ich akzeptiere die oben genannten \n Datenschutzhinweise";
  bool checkBoxState = false;
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
    return new File('$file/dataxyyx2.txt');
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

        body:
        Center(
          child:
          ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                child: Text('Impressum\n', style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 50),
                alignment: Alignment.center,
                child: Text(
                  "Chatbot-app\nV.1.1.0\nEntwecklet von:\nBensouda Hanae\nAzlouk Mohamed Yassine\nRebaa Hassen\nMorchid Abdelhamid",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
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
            ],
          ),
                )
    );
  }
}