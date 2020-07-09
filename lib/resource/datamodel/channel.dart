class Channel {

  final String _id;

  final String _name;

  final bool _isPrivate;

  final DateTime _updateTime;

  Channel(this._id, this._name, this._isPrivate, this._updateTime);

  DateTime get updateTime => _updateTime;

  bool get isPrivate => _isPrivate;

  String get name => _name;

  String get id => _id;


}