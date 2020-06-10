import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _Benutzername , _password,_URL;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(



      body: Form(
          key: _formKey,
          child: Column(




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
                onPressed: () {},
                child: Text('Anmelden'),
              ),



            ],
          )
      ),



    );
  }
}