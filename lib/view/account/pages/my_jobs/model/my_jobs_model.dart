class MyJobsModel {
  MyJobsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.jobs,
  });

  MyJobsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['jobs'] != null) {
      jobs = [];
      json['jobs'].forEach((v) {
        jobs!.add(Jobs.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Jobs>? jobs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (jobs != null) {
      map['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Jobs {
  Jobs({
    this.id,
    this.title,
    this.description,
    this.storeId,
    this.status,
  });

  Jobs.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    storeId = json['store_id'];
    status = json['status'];
  }
  int? id;
  String? title;
  String? description;
  int? storeId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['store_id'] = storeId;
    map['status'] = status;
    return map;
  }
}
