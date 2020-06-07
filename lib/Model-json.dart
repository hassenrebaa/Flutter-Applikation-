
class Botresp {
  String historyID;
  String Username;
  String  text;
  String requestText;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'historyID': historyID,
    'Username': Username,
    'text': text,
    'requestText':requestText,
  };

  Botresp({this.historyID,this.Username,this.text,this.requestText});

  factory Botresp.fromJson(Map<String, dynamic> json) {
    return Botresp(
      historyID: json['historyID'],
      Username: json['Username'],
      text: json['text'],
      requestText: json['requestText'],

    );
  }
}