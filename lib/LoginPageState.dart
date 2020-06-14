/*
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';



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
  var zuz = null;

  Widget getfutur() {
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
                  print(getdata1().toString());
                },
                child: Text('Anmelden'),
              ),
              Container(
                padding: EdgeInsets.all(20.00),
                  child: getfutur(),
              ),
              Container(
                  padding: EdgeInsets.all(20.00),
                  child: new FutureBuilder(
                      future: readData1(),
                      builder: (BuildContext context , AsyncSnapshot<String> data1){
                        if(data1.hasData != null){
                          return new Text(
                            '${data1.data.toString()}',
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
                            ),);
                        }

                      }
                  )),

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
}*/
