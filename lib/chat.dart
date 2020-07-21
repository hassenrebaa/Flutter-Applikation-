import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterapp/Attachment.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';
import 'package:video_player/video_player.dart';
import 'Attachment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:link/link.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

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
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

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
                        block = block;
                      }
                    }
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
  future11(){
  return
 bot.attachments[0].type=="BUTTON"?ListView.builder(
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  itemCount:bot.attachments.length,
  itemBuilder: (context, index) {

  return Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Container(
  height: 20,
  margin: EdgeInsets.all(20.00),
  child: bot.attachments[index].type=="BUTTON"&&bot.attachments!=null?RaisedButton(
  onPressed: () async {
  _futureAlbum = createAlbum("${bot.attachments[index].title}");
  final Attachment1 alb = await createAlbum("${bot
      .attachments[index].title}");

  setState(() {
  bot = alb;
  response(bot.text,false);
  block = block;
  });
  },
  child: Text("${this.bot.attachments[index].title}"),

  ):new Container(),
  ),
  ],
  );
  }

  ):Container();




}

  void response(String text, bool type,{dynamic cool,})  {
    ChatMessage message = ChatMessage(
        text:bot.text,
      type: false,
    cool: null,);
      if (bot.attachments!=null&&bot.attachments[0].type=="BUTTON"){
        message =  ChatMessage(
          text:bot.text,
          type: false,
        cool: future11(),
        );
    }
    if (bot.attachments!=null&&bot.attachments[0].type=="DATE_PICKER"){
      message =  ChatMessage(
        text:bot.text,
        type: false,
        cool: futur1(),
      );
    }
    if (bot.attachments!=null&&bot.attachments[0].type=="IMAGE"){
      message =  ChatMessage(
        text:bot.text,
        type: false,
        cool: futur3(),
      );
    }
    if (bot.attachments!=null&&bot.attachments[0].type=="VIDEO"){
      message =  ChatMessage(
        text:bot.text,
        type: false,
        cool: futurvid(),
      );
    }
    if (bot.attachments!=null&&bot.attachments[0].type=="LINK"){
      message =  ChatMessage(
        text:bot.text,
        type: false,
        cool: futurlink(),
      );
    }
      /*cool: bot.attachments!=null&&bot.attachments[0].type=="BUTTON"?future11():null,
      cool1:bot.attachments!=null&&bot.attachments[0].type=="DATE_PICKER"?futur1():null,
      cool2: bot.attachments!=null&&bot.attachments[0].type=="IMAGE"?futur3():null,
      cool3: bot.attachments!=null&&bot.attachments[0].type=="VIDEO"?futurvid():null,
      cool4: bot.attachments!=null&&bot.attachments[0].type=="LINK"?futurlink():null*/

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
      _messages.insert(0, message);
    });
    response(text,true);

  }
Widget _chatbutton(){
  return SizedBox(
    width: 150,
    height: 70,
    child: RaisedButton(
    color: Colors.blueAccent,
    child: Text("Chat starten!"),
    onPressed: ()async {
      _futureAlbum = createAlbum(txt);
      final Attachment1 alb = await createAlbum(txt);
      setState(() {
        bot= alb;
        response(bot.text,false);

        _visible = !_visible;
      });
      // Call setState. This tells Flutter to rebuild the
      // UI with the changes.
    },
  ),);


}

  Widget futur1 (){
    return
      FutureBuilder<Attachment1>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData && bot.attachments[0].type == "DATE_PICKER") {
            return IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                ).then((date) {
                  setState(() async {
                    _dateTime = date;
                    print(_dateTime);
                    block = block;

                    final Attachment1 alb = await createAlbum(_dateTime
                        .toString());
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

Widget futur3(){
    if(bot.attachments[0].type=="IMAGE") {
      return
        Image.network('${bot.attachments[0].filename}',);

    }
    return new Container();
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
    //  Container(child: futur(),),
      //Container(child: futur1(),),Container(child: futur2(),),
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
      createAlbum(txt);
      /*_controller = bot.attachments[0].type=="VIDEO"?VideoPlayerController.network(
        "${bot.attachments[0].filename}",
      ):null;
      _initializeVideoPlayerFuture = _controller.initialize();

      // Use the controller to loop the video.
      _controller.setLooping(true);*/
    super.initState();
    texto1();
    texto2();
    id();
  }
String historyID="";
   String id(){
    historyID= randomString(10);
    return historyID;

  }
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
  futurvid(){
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done&&bot.attachments[0].type=="VIDEO") {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_controller),
          );
        } else {

          return Center(child: CircularProgressIndicator());
        }
      },
    );


  }




  Widget futur6(){
    return
      ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:bot.attachments.length,
          itemBuilder: (context, index) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 20,
                  margin: EdgeInsets.all(20.00),
                  child: bot.attachments[index].type=="BUTTON"?RaisedButton(
                    onPressed: () async {
                      _futureAlbum = createAlbum("${bot.attachments[index].title}");
                      final Attachment1 alb = await createAlbum("${bot
                          .attachments[index].title}");

                      setState(() {
                        bot = alb;
                        response(bot.text,false);
                        block = block;
                      });
                    },
                    child: Text("${bot.attachments[index].title}"),

                  ):new Container()
                ),

              ],);
          }

      );

  }
  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }
  futurlink(){
     return new Link(
         child: new Text('${bot.attachments[0].title}'),
         url:'${bot.attachments[0].link}',
        onError: _showErrorSnackBar,
     );


  }
  

}


class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.text,
    this.type,
    this.cool,

  });

  final String text;
  final bool type;
  dynamic cool;
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
              child:  new Html (data: text,),
            ),
           //Container(child:cool==null?Container():cool,),
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

