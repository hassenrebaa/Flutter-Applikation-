import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Attachment.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';




class ChatDetails extends StatefulWidget {
  ChatDetails({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;


  @override
  _HomePageDialogflowV2 createState() => _HomePageDialogflowV2();
}

class _HomePageDialogflowV2 extends State<ChatDetails> {
  var  pong = new _LoginPageState();
  final List<Attachment1> att = new List();
  final List<ChatMessage> _messages = <ChatMessage>[];

  final TextEditingController _textController = TextEditingController();
  Attachment1 bot;
  String server="";
  String usr="";



  Future<Attachment1> createAlbum(String text) async {

    final http.Response response1 = await http.post(
      '$server',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'historyID' : 'dsdsadsadasdasddsds',
        'username':  '$usr',
      },
      body: jsonEncode({
        "text": '${text}' ,



      }),
    );
    final jsonresponse = json.decode(response1.body);
    final test =Attachment1.fromJson(jsonresponse[0]);
    att.add(test);
    if (response1.statusCode == 200) {


      print(jsonresponse[0]);
      print(server);
      print(usr);

      return test;
    } else {
      throw Exception('Failed to create...');
    }
  }






  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),

        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                InputDecoration.collapsed(hintText: "Schreiben Sie hier eine Nachricht"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed:  () async{

                  final Attachment1 alb = await createAlbum(_textController.text);
                  setState(() {
                    bot= alb;
                  });
                  _handleSubmitted(_textController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void response(query) async {

    ChatMessage message = ChatMessage(
      text: "${bot.text}",
      type: false,
    );

    setState(() {
      _messages.insert(0, message);

    });
  }



  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      type: true,
    );
    setState(() {
      _messages.insert(0, message,);
    });
    response(text);

  }


  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Flexible(
                flex: 2,
                child:
                ListView(
                    children: <Widget>[
                      Container(
                        child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child:
                                CircleAvatar(

                                  backgroundImage: AssetImage('Images/bot.png'),
                                  backgroundColor: Colors.teal,
                                  radius: 15,
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(right: 16.0),
                                    child:  Text("Hey, was kann ich für Sie tun?"),

                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Expanded(child:
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8.0),
                        reverse: true,
                        itemBuilder: (_, int index) => _messages[index],
                        itemCount: _messages.length,
                      ),
                      )
                    ]),
              ),
              Divider(height: 1.0),
              Flexible(
                flex: 0,
                child:
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
              ),
            ])
    );


}
texto1()async{

  await pong.readData().then((String data) => server=data);

  }
  texto2()async{

    await pong.readData1().then((String data) => usr=data);

  }

    @override
  void initState() {
    super.initState();
    texto1();
    texto2();
  }

  }

class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.text,
    this.type,
  });

  final String text;
  final bool type;
 final pop = _HomePageDialogflowV2();


 Widget roboter() {
   return
   Row(children: <Widget>[ Container(
 margin: const EdgeInsets.only(right: 16.0),
   child: CircleAvatar(
   backgroundImage: AssetImage('Images/bot.png'),
   backgroundColor: Colors.teal,
   radius: 15,
   ),
   ),
   Expanded(
   child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children: <Widget>[

   Container(
   child:  Text("hi"),

   ),

   ],
   ),
   ),
   ],
   );
 }

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('Images/bot.png'),
          backgroundColor: Colors.teal,
          radius: 15,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              child:  Text(text),

            ),

            Container(

              child :Linkify(
                onOpen: (link) => print("Clicked ${link}!"),
                text: "adesso.de",
              ),
            ),
          ],
        ),
      ),
    ];

  }

  List<Widget> myMessage(context) {
    return <Widget>[

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('Images/user.png'),
          backgroundColor: Colors.white,
          minRadius: 15,
        ),
      ),
    ];

  }

  @override
  Widget build(BuildContext context) {


return
    Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(

    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    this.type ? myMessage(context) : otherMessage(context),
    ),
    );




  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}
test(){
  return null;
}


class _LoginPageState extends State<LoginPage> {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Benutzername , _password,_URL;
  TextEditingController serverController = new TextEditingController();
  TextEditingController benutzerController = new TextEditingController();
  var  urlserver="";
  var  username="";

 /* Widget getfutur() {
    return
      new FutureBuilder(
          future: readData(),
          builder: (BuildContext context , AsyncSnapshot<String> data){
            if(data.hasData != null){
              return new Text(
                '${data.data.toString()}',
                style: new TextStyle(
                  fontSize: 22.2,
                  color: Colors.blue,
                ),);
            }else{
              return new Text(
                'No data saved !',
                style: new TextStyle(
                  fontSize: 11.0,
                  color: Colors.blue,
                ),
              );
            }

          }
      ) ;
  }
  Widget getfutur1() {
    return
      new FutureBuilder(
          future: readData1(),
          builder: (BuildContext context , AsyncSnapshot<String> data){
            if(data.hasData != null){
              return new Text(
                '${data.data.toString()}',
                style: new TextStyle(
                  fontSize: 22.2,
                  color: Colors.blue,
                ),);
            }else{
              return new Text(
                'No data saved !',
                style: new TextStyle(
                  fontSize: 11.0,
                  color: Colors.blue,
                ),
              );
            }

          }
      ) ;
  }*/

   texto() async{

    readData().then((String data){
      setState(() {
        urlserver = data;
      });
      return urlserver;
    });
}
  textou() async{

    readData1().then((String data){
      setState(() {
        username = data;
      });
      return username;
    });
  }

  void initState() {
    super.initState();
   texto();
   textou();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(



        body: ListView( key: _formKey,
          children: <Widget>[
            Column(

              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Benutzername ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Passwort  ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an Sever URL';
                    }
                  },
                  controller: serverController,
                  decoration: InputDecoration(
                    labelText: 'Server URL',



                  ),
                  onSaved: (input) => _URL= input,
                ),




                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an Benutzername';
                    }
                  },
                  controller: benutzerController,
                  decoration: InputDecoration(
                    labelText: 'Benutzername',



                  ),
                  onSaved: (input) => _Benutzername = input,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: () {
                    writeData(serverController.text);
                    writeData1(benutzerController.text);

                    print('saved !');
                    print(urlserver);
                    print(username);
                  },
                  child: Text('Anmelden'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("serverurl: $urlserver",style: TextStyle(
    color: Colors.blueAccent, fontSize: 13, fontWeight: FontWeight.bold )),
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("username: $username",style: TextStyle(
    color: Colors.blueAccent, fontSize: 15, fontWeight: FontWeight.bold)),

                ),],
            ),
          ],
        )
    );
  }
  Future<String> get localPath async{
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }
  Future<String> get localPath1 async{
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }

  Future<File> get localFile  async{
    final file = await localPath;
    return new File('$file/data1.txt');
  }

  Future<File> get localFile1  async{
    final file = await localPath1;
    return new File('$file/data2.txt');
  }


  Future<File>   writeData(String value)  async{
    final file = await localFile;
    return file.writeAsString('${value}');
  }
  Future<File>   writeData1(String value)  async{
    final file = await localFile1;
    return file.writeAsString('${value}');
  }


  Future<String> readData() async{

    try{
      final file = await localFile;
      String data = await file.readAsString();
      return data;
    }catch(e){
      return 'error: empty file';
    }
  }

  Future<String> readData1() async{

    try{
      final file = await localFile1;
      String data1 = await file.readAsString();
      return data1;
    }catch(e){
      return 'error: empty file';
    }
  }

}

