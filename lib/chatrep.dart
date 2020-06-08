import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// Chat-Commit
class Album {
  String historyID;
  String Username;
  String  text;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'historyID': historyID,
    'Username': Username,
    'text': text,
  };

  Album({this.historyID,this.Username,this.text});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      historyID: json['historyID'],
      Username: json['Username'],
      text: json['text'],

    );
  }
}