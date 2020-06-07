
class Album {
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

  Album({this.historyID,this.Username,this.text,this.requestText});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      historyID: json['historyID'],
      Username: json['Username'],
      text: json['text'],
      requestText: json['requestText'],

    );
  }
}