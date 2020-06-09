import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Botresp {
  String historyID;
  String Username;
  String  text;


  Map<String, dynamic> toJson() => <String, dynamic>{
    'historyID': historyID,
    'Username': Username,
    'text': text,

  };

  Botresp({this.historyID,this.Username,this.text,});

  factory Botresp.fromJson(Map<String, dynamic> json) {
    return Botresp(
      historyID: json['historyID'],
      Username: json['Username'],
      text: json['text'],


    );
  }
}