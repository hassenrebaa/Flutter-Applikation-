import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/uierstellen/Attachement.dart';


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'chatrep.dart';


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
  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<Attachment> _attachement = <Attachment>[];
  final TextEditingController _textController = TextEditingController();
  
  Welcome bot;

  Future<Welcome> createAlbum(String text) async {

    final http.Response response1 = await http.post(
      'https://runtime-demo.eu-de.mybluemix.net/api/chat',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'historyID' : 'dsdsadsadasdasddsds',
        'username':  'test',
      },
      body: jsonEncode({
        "text": '${text}' ,
      }),
    );

    final jsonresponse = json.decode(response1.body);

    if (response1.statusCode == 200) {
      print(jsonresponse[0]);


      for (int i = 0; i < _attachement.length; i++) {

          print('url : ${_attachement[i]}');

      }
      return Welcome.fromJson(jsonresponse);
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

                  final Welcome alb = await createAlbum(_textController.text);
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('Images/bot.png'),
                    backgroundColor: Colors.grey[200],
                    minRadius: 20,
                  ),
                ),
                Expanded(
                  child:  Container(
                    child: Text("iii"),
                  ),
                ),
              ],
            ),

            Flexible(
                child:
                ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                )),
            Divider(height: 1.0),

            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({
    this.text,
    this.link,
    this.type,
  });

  final String text;
  final String link;
  final bool type;


 var  pop = _HomePageDialogflowV2();

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

            pop.bot == null ? Container() :

            Text("${pop.bot.text}"),

            Container(
              child:  Text(text),

            )



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
              child: Text(this.text),
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}