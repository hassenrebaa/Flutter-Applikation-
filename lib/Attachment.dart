// To parse this JSON data, do
//
//     final attachment1 = attachment1FromJson(jsonString);

import 'dart:convert';

Attachment1 attachment1FromJson(String str) => Attachment1.fromJson(json.decode(str));


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
  String text;l
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
    attachments: parseAtachment(json),
    action: json["action"],
    encouragerTime: json["encouragerTime"],
    activeBot: json["activeBot"],
    botName: json["botName"],
    messageKey: json["messageKey"],
    error: json["error"],
  );
  static List<Attachment> parseAtachment(AttachmentJson) {
    var list = AttachmentJson['attachments'] as List;
    List<Attachment> AtatchmentList = list?.map((e)  => Attachment.fromJson(e))?.toList()??[];
    return AtatchmentList;
  }

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

  factory Attachment.fromJson(Map<String, dynamic> parsedjson) =>
      Attachment(
        id: parsedjson["id"],
        type: parsedjson["type"],
        filename: parsedjson["filename"],
        thumbnailFilename: parsedjson["thumbnailFilename"],
        title: parsedjson["title"],
        action: parsedjson["action"],
        video: parsedjson["video"],
        link: parsedjson["link"],
        accordionText: parsedjson["accordionText"],
        datePickerRange: parsedjson["datePickerRange"],
        mediaType: parsedjson["mediaType"],
        multipleChoiceOptions: parsedjson["multipleChoiceOptions"],
      );

}
