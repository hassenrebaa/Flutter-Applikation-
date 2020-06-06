/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Einstellung.dart';
import 'Layout.dart';
import 'chat.dart';

void main()  => runApp(
    MaterialApp(
        title : 'Energie App',
        home: Home()));

/// This Widget is the main application widget.
class Home extends StatefulWidget {



  @override
  _HomeState createState() =>_HomeState();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }

}
class _HomeState extends State<Home>{
  int _currentIndex = 0;
  final tabs=[
    Center(
      child: Column(
  children: <Widget>[
    Container(
      margin: const EdgeInsets.all(70.0),
      alignment: Alignment.center,
    child:  CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('Images/bot.png'),
      ),
    ),
   Text(" Hallo! ich bin Roby\nwas kann ich für Sie tun?",style: TextStyle(color: Colors.teal, fontSize: 25,fontWeight: FontWeight.bold),),
  ],),
  ),

    Center(child: ChatDetails(),),
    Center(child:),
    Center (child: MyApp()),
    Center(child: ListView(
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
    ),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energie-App'),
      ),
      body:tabs[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
          currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text('Chat'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text('Settings'),
            backgroundColor: Colors.lightBlueAccent,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Info'),
            backgroundColor: Colors.lightBlueAccent,

          )
        ],
        onTap: (index){{
          setState(() {
              _currentIndex = index;
          });
          }
        },

      ),

    );
  }
}*/
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future<Album> createAlbum(String text) async {
  final http.Response response = await http.post(
    'https://runtime-demo.eu-de.mybluemix.net/api/chat',
    headers: <String, String>{
      'Content-Type':'application/json; charset=UTF-8',
      'historyID':'dsdsadsadasdasddsds',
      'username':'test',
    },
    body: jsonEncode(<String, String>{
      "text": '${text}' ,
    }),
  );
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create...');
  }
}
class Album {
  final String historyID;
  final String Username;
  final String text;


  Album({this.historyID,this.Username,this.text});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      historyID: json['historyID'],
      Username: json['Username'],
      text: json['text'],

    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: 'Enter Title'),
              ),
              RaisedButton(
                child: Text('Create Data'),
                onPressed: () {
                  setState(() {
                    _futureAlbum = createAlbum(_controller.text);
                  });
                },
              ),
            ],
          )
              : FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.text);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}