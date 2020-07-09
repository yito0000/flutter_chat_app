class ChannelJson {

  final String _id;

  final String _name;

  final String _isPrivate;

  final String _updateTime;

  ChannelJson(this._id, this._name, this._isPrivate, this._updateTime);

  String get updateTime => _updateTime;

  String get isPrivate => _isPrivate;

  String get name => _name;

  String get id => _id;

  factory ChannelJson.fromJson(Map<String, dynamic> json) {
    return ChannelJson(
      json['id'],
      json['name'],
      json['isPrivate'],
      json['updateTime'],
    );
  }

  @override
  String toString() {
    return 'ChannelJson{_id: $_id, _name: $_name, _isPrivate: $_isPrivate, _updateTime: $_updateTime}';
  }
}