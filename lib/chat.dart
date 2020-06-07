import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
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

  Album  _futureAlbum ;
  Future<Album> createAlbum(String text) async {

    final http.Response response1 = await http.post(
      'https://runtime-demo.eu-de.mybluemix.net/api/chat',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'historyID' : 'dsdsadsadasdasddsds',
        'username':  'test',
      },
      body: jsonEncode(<String, String>{
        "text": text ,

      }),
    );
    final jsonresponse = json.decode(response1.body);
    if (response1.statusCode == 200) {
      return Album.fromJson(jsonresponse[0]);
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
               // onSubmitted: _handleSubmitted,
                decoration:
                InputDecoration.collapsed(hintText: "Schreiben Sie hier eine Nachricht"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed:  () async{
                  _handleSubmitted(_textController.text);
                  final Album alb = await createAlbum(_textController.text);
                  setState(() {
                    _futureAlbum= alb;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void response(query) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: "${_futureAlbum.text}",

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

