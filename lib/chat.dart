import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'Model-json.dart';
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
  final TextEditingController _textController = TextEditingController();
  Botresp _chat;
  String url = 'https://runtime-demo.eu-de.mybluemix.net/api/chat';

  Future<Botresp> tuarequest(String requestText) async{

    final http.Response response = await http.post(url,headers: <String,String>{"Accept": "application/json",
  //'historyID': historyID,
  //'username': username
}, body:{
    'requestText': requestText,
    });
  if (response.statusCode== 201) {
  return Botresp.fromJson(json.decode(response.body));
  } else {
  throw Exception('Failed to create album.');
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

                onPressed: () async
                {
                  final String requestText = _textController.text;

                  final Botresp rep = await tuarequest(requestText);
                  setState(() {
                _chat = rep;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void response1(query) async {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: "",

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
    tuarequest;
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
                  child: Container(
                    child: Text(
                      "Herzlich willkommen bei unserer Energie-App!\nIch bin"
                          "ein Chatbot Meine Name ist Roby und bin da zu helfen",
                      style: TextStyle(color: Colors.black),),

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
        Divider(height: 2.0),

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
    this.type,
  });

  final String text;

  final bool type;

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
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Herzlich willkommen bei unserer Energie-App!\nIch bin "
                  "ein Chatbot Meine Name ist Roby und bin da zu helfen"),
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}



