// To parse this JSON data, do
//
//     final botresp = botrespFromJson(jsonString);

import 'dart:convert';

Botresp botrespFromJson(String str) => Botresp.fromJson(json.decode(str));

String botrespToJson(Botresp data) => json.encode(data.toJson());

class Botresp {
  Botresp({
    this.requestText,
    this.text,
    this.accessToken,
    this.action,
    this.encouragerTime,
    this.activeBot,
    this.botName,
    this.messageKey,
    this.error,
  });

  dynamic requestText;
  String text;
  dynamic accessToken;
  dynamic action;
  dynamic encouragerTime;
  dynamic activeBot;
  dynamic botName;
  dynamic messageKey;
  bool error;

  factory Botresp.fromJson(Map<String, dynamic> json) => Botresp(
    requestText: json["requestText"],
    text: json["text"],
    accessToken: json["accessToken"],
    action: json["action"],
    encouragerTime: json["encouragerTime"],
    activeBot: json["activeBot"],
    botName: json["botName"],
    messageKey: json["messageKey"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "requestText": requestText,
    "text": text,
    "accessToken": accessToken,
    "action": action,
    "encouragerTime": encouragerTime,
    "activeBot": activeBot,
    "botName": botName,
    "messageKey": messageKey,
    "error": error,
  };
}
