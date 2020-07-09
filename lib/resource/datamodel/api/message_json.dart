class MessageJson {

  final String _id;

  final String _text;

  final String _dateTime;

  MessageJson(this._id, this._text, this._dateTime);

  String get dateTime => _dateTime;

  String get text => _text;

  String get id => _id;

  factory MessageJson.fromJson(Map<String, dynamic> json) {
    return MessageJson(
      json['id'],
      json['value'],
      json['dateTime'],
    );
  }
}