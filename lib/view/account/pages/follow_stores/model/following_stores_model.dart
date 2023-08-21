class FollowingStoresModel {
  FollowingStoresModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.following,
  });

  FollowingStoresModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['following'] != null) {
      following = [];
      json['following'].forEach((v) {
        following!.add(Following.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Following>? following;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (following != null) {
      map['following'] = following!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Following {
  Following({
    this.id,
    this.name,
    this.userName,
    this.profilePhotoUrl,
  });

  Following.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  int? id;
  String? name;
  String? userName;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['user_name'] = userName;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
