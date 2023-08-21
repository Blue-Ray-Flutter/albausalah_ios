import 'dart:convert';

/// status : 200
/// success : true
/// request_date : "2023-Jul-24"
/// msg : ""
/// notifications_counter : 1

NotificationsCountModel notificationsCountModelFromJson(String str) =>
    NotificationsCountModel.fromJson(json.decode(str));
String notificationsCountModelToJson(NotificationsCountModel data) =>
    json.encode(data.toJson());

class NotificationsCountModel {
  NotificationsCountModel({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    int? notificationsCounter,
  }) {
    _status = status;
    _success = success;
    _requestDate = requestDate;
    _msg = msg;
    _notificationsCounter = notificationsCounter;
  }

  NotificationsCountModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _requestDate = json['request_date'];
    _msg = json['msg'];
    _notificationsCounter = json['notifications_counter'];
  }
  int? _status;
  bool? _success;
  String? _requestDate;
  String? _msg;
  int? _notificationsCounter;
  NotificationsCountModel copyWith({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    int? notificationsCounter,
  }) =>
      NotificationsCountModel(
        status: status ?? _status,
        success: success ?? _success,
        requestDate: requestDate ?? _requestDate,
        msg: msg ?? _msg,
        notificationsCounter: notificationsCounter ?? _notificationsCounter,
      );
  int? get status => _status;
  bool? get success => _success;
  String? get requestDate => _requestDate;
  String? get msg => _msg;
  int? get notificationsCounter => _notificationsCounter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['request_date'] = _requestDate;
    map['msg'] = _msg;
    map['notifications_counter'] = _notificationsCounter;
    return map;
  }
}
