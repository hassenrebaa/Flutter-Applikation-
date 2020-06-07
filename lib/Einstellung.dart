
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  bool isSwitched =false ;
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
            child: new ListView(
              children: <Widget>[
                //new Container (child: new DrawerHeader(child: new CircleAvatar()),color: Colors.tealAccent,),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Sicherheit'),
                    leading: Icon(Icons.security),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child:ListTile(
                    title:Text('Profilbild ändern'),
                    leading: Icon(Icons.settings, color:Colors.blue,),
                  ),
                ),

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
                InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
  Expanded(
                 child: ListTile(
                    title:Text('Benachrichtigung'),
                    leading: Icon(Icons.settings, color:Colors.blue,),),),

                  Container(

                      padding:EdgeInsets.all(8.0) ,
                      margin: EdgeInsets.all(8.0),
                      alignment: Alignment.centerRight,
                      child:Switch (
                        value: isSwitched,
                        onChanged: (value){
                          isSwitched =value;
                          print(isSwitched);
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                  ),
                    ],
                  ),
                  ),

      Container(
                  child:ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    leading: Icon(Icons.person_add , color:Colors.blue),
                    title: Text("Konto-hinzufügen") // Hier Änderung Hassens 
                  ),
                  alignment: Alignment.bottomLeft,

                ),




              ],
            ),
        ),
        );



  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Benutzername , _password,_URL;

  String url = 'https://runtime-demo.eu-de.mybluemix.net/api/chat';

  // ignore: missing_return
  Future<String> makeRequest() async{
    var response =
    await http.post(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    print(response.body);

  }

  Widget build(BuildContext context) {
    return
      Scaffold(appBar: AppBar(
        title: Text("Anmelden"),
      ),

      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(

          child:    TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an Sever URL';
                  }
                },
                decoration: InputDecoration(
                  labelText: '   Server URL',

                ),
                onSaved: (input) => _URL= input,
              ),
              ),
              Container(

                child:
                TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide an Benutzername';
                  }
                },
                decoration: InputDecoration(
                  labelText: '   Benutzername',

                ),
                onSaved: (input) => _Benutzername = input,
              ),
              ),

              Container(

                child:
                TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: '   Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),),
              RaisedButton(
                onPressed: makeRequest,
              child: Text('Anmelden'),
              ),
            ],
          )
      ),
    );
  }
}





