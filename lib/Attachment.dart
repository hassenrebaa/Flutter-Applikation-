// To parse this JSON data, do
//
//     final attachment1 = attachment1FromJson(jsonString);

import 'dart:convert';

Attachment1 attachment1FromJson(String str) => Attachment1.fromJson(json.decode(str));

String attachment1ToJson(Attachment1 data) => json.encode(data.toJson());

class Attachment1 {
  Attachment1({
    this.requestText,
    this.text,
    this.accessToken,
    this.attachments,
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
  List<Attachment> attachments;
  dynamic action;
  dynamic encouragerTime;
  dynamic activeBot;
  dynamic botName;
  dynamic messageKey;
  bool error;

  factory Attachment1.fromJson(Map<String, dynamic> json) => Attachment1(
    requestText: json["requestText"],
    text: json["text"],
    accessToken: json["accessToken"],
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
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
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "action": action,
    "encouragerTime": encouragerTime,
    "activeBot": activeBot,
    "botName": botName,
    "messageKey": messageKey,
    "error": error,
  };
}

class Attachment {
  Attachment({
    this.id,
    this.type,
    this.filename,
    this.thumbnailFilename,
    this.title,
    this.action,
    this.video,
    this.link,
    this.accordionText,
    this.datePickerRange,
    this.mediaType,
    this.multipleChoiceOptions,
  });

  String id;
  String type;
  String filename;
  String thumbnailFilename;
  String title;
  String action;
  dynamic video;
  String link;
  String accordionText;
  String datePickerRange;
  dynamic mediaType;
  dynamic multipleChoiceOptions;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    id: json["id"],
    type: json["type"],
    filename: json["filename"],
    thumbnailFilename: json["thumbnailFilename"],
    title: json["title"],
    action: json["action"],
    video: json["video"],
    link: json["link"],
    accordionText: json["accordionText"],
    datePickerRange: json["datePickerRange"],
    mediaType: json["mediaType"],
    multipleChoiceOptions: json["multipleChoiceOptions"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "filename": filename,
    "thumbnailFilename": thumbnailFilename,
    "title": title,
    "action": action,
    "video": video,
    "link": link,
    "accordionText": accordionText,
    "datePickerRange": datePickerRange,
    "mediaType": mediaType,
    "multipleChoiceOptions": multipleChoiceOptions,
  };
}
