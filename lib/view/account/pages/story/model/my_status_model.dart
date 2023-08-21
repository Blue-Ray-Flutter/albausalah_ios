import '../../../../home/model/StatusModel.dart';

class MyStatusModel {
  MyStatusModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.statuses,
  });

  MyStatusModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['statuses'] != null) {
      statuses = [];
      json['statuses'].forEach((v) {
        statuses!.add(StoreStatuses.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<StoreStatuses>? statuses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (statuses != null) {
      map['statuses'] = statuses!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

// class Statuses {
//   Statuses({
//     this.id,
//     this.file,
//     this.post,
//     this.url,
//     this.storeId,
//     this.expireAt,
//     this.fileType,
//     this.liveStatus,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   Statuses.fromJson(dynamic json) {
//     id = json['id'];
//     file = json['file'];
//     post = json['post'];
//     url = json['url'];
//     storeId = json['store_id'];
//     expireAt = json['expire_at'];
//     fileType = json['file_type'];
//     liveStatus = json['live_status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//   int? id;
//   String? file;
//   String? post;
//   String? url;
//   int? storeId;
//   String? expireAt;
//   String? fileType;
//   String? liveStatus;
//   String? createdAt;
//   String? updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['file'] = file;
//     map['post'] = post;
//     map['url'] = url;
//     map['store_id'] = storeId;
//     map['expire_at'] = expireAt;
//     map['file_type'] = fileType;
//     map['live_status'] = liveStatus;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     return map;
//   }
// }
