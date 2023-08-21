import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));
String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    List<Notifications>? notifications,
  }) {
    _status = status;
    _success = success;
    _requestDate = requestDate;
    _msg = msg;
    _notifications = notifications;
  }

  NotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _requestDate = json['request_date'];
    _msg = json['msg'];
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  int? _status;
  bool? _success;
  String? _requestDate;
  String? _msg;
  List<Notifications>? _notifications;
  NotificationModel copyWith({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    List<Notifications>? notifications,
  }) =>
      NotificationModel(
        status: status ?? _status,
        success: success ?? _success,
        requestDate: requestDate ?? _requestDate,
        msg: msg ?? _msg,
        notifications: notifications ?? _notifications,
      );
  int? get status => _status;
  bool? get success => _success;
  String? get requestDate => _requestDate;
  String? get msg => _msg;
  List<Notifications>? get notifications => _notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['request_date'] = _requestDate;
    map['msg'] = _msg;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));
String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    int? id,
    int? userId,
    int? createdBy,
    int? basedId,
    String? notificationGuideKey,
    String? modelName,
    String? routeName,
    String? readAt,
    String? createdAt,
    String? updatedAt,
    String? notificationDetails,
    int? notificationNameFlag,
    NotificationGuide? notificationGuide,
  }) {
    _id = id;
    _userId = userId;
    _basedId = basedId;
    _createdBy = createdBy;
    _notificationGuideKey = notificationGuideKey;
    _modelName = modelName;
    _routeName = routeName;
    _readAt = readAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _notificationDetails = notificationDetails;
    _notificationNameFlag = notificationNameFlag;
    _notificationGuide = notificationGuide;
  }

  Notifications.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _basedId = json['based_id'];
    _createdBy = json['created_by'];
    _notificationGuideKey = json['notification_guide_key'];
    _modelName = json['model_name'];
    _routeName = json['route_name'];
    _readAt = json['read_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _notificationDetails = json['notification_details'];
    _notificationNameFlag = json['notification_name_flag'];
    _notificationGuide = json['notification_guide'] != null
        ? NotificationGuide.fromJson(json['notification_guide'])
        : null;
  }
  int? _id;
  int? _userId;
  int? _createdBy;
  int? _basedId;
  String? _notificationGuideKey;
  String? _modelName;
  String? _routeName;
  String? _readAt;
  String? _createdAt;
  String? _updatedAt;
  String? _notificationDetails;
  int? _notificationNameFlag;
  NotificationGuide? _notificationGuide;
  Notifications copyWith({
    int? id,
    int? userId,
    int? createdBy,
    int? basedId,
    String? notificationGuideKey,
    String? modelName,
    String? routeName,
    String? readAt,
    String? createdAt,
    String? updatedAt,
    String? notificationDetails,
    int? notificationNameFlag,
    NotificationGuide? notificationGuide,
  }) =>
      Notifications(
        id: id ?? _id,
        userId: userId ?? _userId,
        createdBy: createdBy ?? _createdBy,
        basedId: basedId ?? _basedId,
        notificationGuideKey: notificationGuideKey ?? _notificationGuideKey,
        modelName: modelName ?? _modelName,
        routeName: routeName ?? _routeName,
        readAt: readAt ?? '',
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        notificationDetails: notificationDetails ?? _notificationDetails,
        notificationNameFlag: notificationNameFlag ?? _notificationNameFlag,
        notificationGuide: notificationGuide ?? _notificationGuide,
      );
  int? get id => _id;
  int? get userId => _userId;
  int? get createdBy => _createdBy;
  int? get basedId => _basedId;
  String? get notificationGuideKey => _notificationGuideKey;
  String? get modelName => _modelName;
  String? get routeName => _routeName;
  String? get readAt => _readAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get notificationDetails => _notificationDetails;
  int? get notificationNameFlag => _notificationNameFlag;
  NotificationGuide? get notificationGuide => _notificationGuide;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['based_id'] = _basedId;
    map['created_by'] = _createdBy;
    map['notification_guide_key'] = _notificationGuideKey;
    map['model_name'] = _modelName;
    map['route_name'] = _routeName;
    map['read_at'] = _readAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['notification_details'] = _notificationDetails;
    map['notification_name_flag'] = _notificationNameFlag;
    if (_notificationGuide != null) {
      map['notification_guide'] = _notificationGuide?.toJson();
    }
    return map;
  }
}

NotificationGuide notificationGuideFromJson(String str) =>
    NotificationGuide.fromJson(json.decode(str));
String notificationGuideToJson(NotificationGuide data) =>
    json.encode(data.toJson());

class NotificationGuide {
  NotificationGuide({
    int? id,
    String? titleGuideAr,
    String? titleGuideEn,
    String? notificationKey,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _titleGuideAr = titleGuideAr;
    _titleGuideEn = titleGuideEn;
    _notificationKey = notificationKey;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  NotificationGuide.fromJson(dynamic json) {
    _id = json['id'];
    _titleGuideAr = json['title_guide_ar'];
    _titleGuideEn = json['title_guide_en'];
    _notificationKey = json['notification_key'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _titleGuideAr;
  String? _titleGuideEn;
  String? _notificationKey;
  String? _createdAt;
  String? _updatedAt;
  NotificationGuide copyWith({
    int? id,
    String? titleGuideAr,
    String? titleGuideEn,
    String? notificationKey,
    String? createdAt,
    String? updatedAt,
  }) =>
      NotificationGuide(
        id: id ?? _id,
        titleGuideAr: titleGuideAr ?? _titleGuideAr,
        titleGuideEn: titleGuideEn ?? _titleGuideEn,
        notificationKey: notificationKey ?? _notificationKey,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get titleGuideAr => _titleGuideAr;
  String? get titleGuideEn => _titleGuideEn;
  String? get notificationKey => _notificationKey;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title_guide_ar'] = _titleGuideAr;
    map['title_guide_en'] = _titleGuideEn;
    map['notification_key'] = _notificationKey;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
