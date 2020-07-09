class Message {

  final String _id;

  final String _text;

  final DateTime _dateTime;

  Message(this._id, this._text, this._dateTime);

  DateTime get dateTime => _dateTime;

  String get text => _text;

  String get id => _id;

  @override
  String toString() {
    return "id = ${this.id}, text = ${this.text}, dateTime = ${this.dateTime.toString()}";
  }
}
