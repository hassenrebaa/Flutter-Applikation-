import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Attachment.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

import 'Attachment.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  var  piw = new _HomePageDialogflowV2();

  @override
  _HomePageDialogflowV2 createState() => _HomePageDialogflowV2();
}

class _HomePageDialogflowV2 extends State<ChatDetails> {
  var  pong = new _LoginPageState();
  final List<Attachment1> att = new List();
  final List<ChatMessage> _messages = <ChatMessage>[];
 // final kong = new ChatMessage();
  final TextEditingController _textController = TextEditingController();
  Attachment1 bot ;
  Attachment1 bot1 ;
  String server="";
  String usr="";
  DateTime _dateTime;
  bool _visible = true;
  String txt = "";
  Future<Attachment1> _futureAlbum;
  bool block =true;

  Future<Attachment1> createAlbum(String text) async {

    final http.Response response1 = await http.post(
      '$server',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'historyID' : '$historyID',
        'username':  '$usr',
        'configurationId': '5ed0d05b95b0ba16f9690d31',
      },
      body: jsonEncode({
        "text": '${text}',
      }),
    );
    final jsonresponse = json.decode(response1.body);
 final Attachment1 test =Attachment1.fromJson(jsonresponse[0]);

    if (response1.statusCode == 200) {
      print(jsonresponse[0]);
      print(server);
      print(usr);
      print(historyID.toString());
      //print(bot.attachments[0].filename);
      //print(test.attachments[0].type);
      //print(bot.attachments[0].id);
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
                enabled: block?true:false,
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

                  _futureAlbum = createAlbum(_textController.text);
                  final Attachment1 alb = await createAlbum(_textController.text);

                  setState(() {
                    bot= alb;
                    for(int i =0;i<bot.attachments.length;i++) {
                      if (bot.attachments[i].type == "LOCK_INPUT"||bot.attachments[i].type == "DATE_PICKER") {
                        block = !block;
                      }
                    }
                  });
                  _handleSubmitted(_textController.text);
                },
              ),
            ),
            /*Container(child:  IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() async{
                    _dateTime = date;
                    print(_dateTime);

                    final Attachment1 alb = await createAlbum(_dateTime.toString());
               setState(() {
               bot= alb;
               response(bot.text);
                  });
                  });
                });

              },
            ),
            )*/
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
Widget _chatbutton(){
  return SizedBox(
    width: 150,
    height: 70,
    child: RaisedButton(
    color: Colors.blueAccent,
    child: Text("Chat starten!"),
    onPressed: ()async {
      final Attachment1 alb = await createAlbum(txt);
      setState(() {
        bot= alb;
        response(bot.text);
        _visible = !_visible;
      });
      // Call setState. This tells Flutter to rebuild the
      // UI with the changes.
    },
  ),);


}
  String manu ="manuell";
  String bild ="Bild";
  Widget futur (){
    return
      FutureBuilder<Attachment1>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData&&bot.attachments[0].type=="BUTTON"&&bot.attachments[1].type=="BUTTON") {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.00),
                child: RaisedButton(

            child: Text('${bot.attachments[0].title}') ,
          onPressed: ()async {
            final Attachment1 alb= await createAlbum("$manu");

         setState(() {
        bot=alb;
          });
         _handleSubmitted(txt);
          },
          ),
              ),
          Container(
            margin: EdgeInsets.all(20.00),
            child: RaisedButton(
            child: Text("Bild") ,
            onPressed: ()async {
            await createAlbum('${bot.attachments[0].action}');
            setState(() {
              response(bot.text);
            });
            },
            ),
          )],);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return new Container();
        },
      );
  }
  Widget futur1 (){
    return
      FutureBuilder<Attachment1>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData&&bot.attachments[0].type=="DATE_PICKER") {
            return IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() async{
                    _dateTime = date;
                    print(_dateTime);

                    final Attachment1 alb = await createAlbum(_dateTime.toString());
                    setState(() {
      print(_dateTime.toString());
                    });
                  });
                });
              },
            );

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return new Container();
        },
      );
  }
  Widget futur2 (){
    return
      FutureBuilder<Attachment1>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData&&bot.attachments[0].type=="IMAGE") {

            return Image.network('${bot.attachments[0].filename}',);

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return new Container();
        },
      );
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        new Expanded(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              shrinkWrap: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )
        ),
        new Divider(height: 1.0),
      Container(child: futur(),),
      Container(child: futur1(),),
            Container(child: futur2(),),
      Container(child: _visible?_chatbutton():new Container(
        decoration: new BoxDecoration(color: Theme.of(context).cardColor),
        child: _buildTextComposer(),
      ),
    ),


      ]),
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
      //createAlbum(txt);
    super.initState();
    texto1();
    texto2();
    id();
    futur();
  }
String historyID="";
   String id(){
    historyID= randomString(10);
    return historyID;

  }
}


class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.text,
    this.type,
    this.pop,
  });

  final String text;
  final bool type;
 _HomePageDialogflowV2 pop =new  _HomePageDialogflowV2();
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
           /* Container( child:
            Text( "${pop.futur()}")
            ),*/
      // pop.bot.attachments!=null&&pop.bot.attachments[0].type=="BUTTON"?new RaisedButton(child:Text ("m"), onPressed: null):new Container()
         /*   new RaisedButton(child:Text ("m"), onPressed: (){

             print(pop.bot.attachments[0].type);
            }
            )*/
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
                      hintText: urlserver,
                      icon: Icon(Icons.link),
                    ),
                    onSaved: (input) => _URL= input,
                  ),

                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  height: 70,
                  child:
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an Benutzername';
                    }
                  },
                  controller: benutzerController,

                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: username,
                  ),
                  onSaved: (input) => _Benutzername = input,
                ),


                  ),
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  height: 70,
                  child:
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Longer password please';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),

                ),

                RaisedButton(
                  onPressed: () {
                    writeData(serverController.text);
                    writeData1(benutzerController.text);
                    print('saved!');
                    print(urlserver);
                    print(username);
                  },
                  child: Text('Anmelden'),
                ),
              ],
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

