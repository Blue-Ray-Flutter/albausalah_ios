class FollowersModel {
  FollowersModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.followers,
  });

  FollowersModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['followers'] != null) {
      followers = [];
      json['followers'].forEach((v) {
        followers!.add(Followers.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Followers>? followers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (followers != null) {
      map['followers'] = followers!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Followers {
  Followers({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.userType,
  });

  Followers.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? profilePhotoUrl;
  String? userType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['user_name'] = userName;
    map['email'] = email;
    map['phone'] = phone;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
