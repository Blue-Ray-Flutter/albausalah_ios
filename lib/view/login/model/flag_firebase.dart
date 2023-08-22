/// status : true

class FlagFirebase {
  FlagFirebase({
    bool? status,
  }) {
    _status = status;
  }

  FlagFirebase.fromJson(dynamic json) {
    _status = json['status'];
  }
  bool? _status;
  FlagFirebase copyWith({
    bool? status,
  }) =>
      FlagFirebase(
        status: status ?? _status,
      );
  bool? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }
}
