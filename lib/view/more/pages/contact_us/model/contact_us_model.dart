import 'dart:convert';

/// status : 200
/// success : true
/// request_date : "2023-Jul-11"
/// msg : ""
/// contactUs : {"id":1,"email_one":"info@albausalah.com","email_two":"info@albausalah.com","mobile":"+964 1800 33355","whatsapp_number":"+964 9595959","support_email_one":"info@albausalah.com","support_email_two":"info@albausalah1.com","support_mobile_one":"+964 1800 3335566","support_mobile_two":"+964 1800 3335566","address":"جميع أنحاء العراق","facebook_url":"https://www.facebook.com/","twitter_url":"https://www.twitter.com/","instagram_url":"https://www.instagram.com/","youtube_url":"https://www.youtube.com/","created_at":"2023-07-10T11:54:59.000000Z","updated_at":"2023-07-10T11:54:59.000000Z"}

ContactUsModel contactUsModelFromJson(String str) =>
    ContactUsModel.fromJson(json.decode(str));
String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
  ContactUsModel({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    ContactUs? contactUs,
  }) {
    _status = status;
    _success = success;
    _requestDate = requestDate;
    _msg = msg;
    _contactUs = contactUs;
  }

  ContactUsModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _requestDate = json['request_date'];
    _msg = json['msg'];
    _contactUs = json['contactUs'] != null
        ? ContactUs.fromJson(json['contactUs'])
        : null;
  }
  int? _status;
  bool? _success;
  String? _requestDate;
  String? _msg;
  ContactUs? _contactUs;
  ContactUsModel copyWith({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    ContactUs? contactUs,
  }) =>
      ContactUsModel(
        status: status ?? _status,
        success: success ?? _success,
        requestDate: requestDate ?? _requestDate,
        msg: msg ?? _msg,
        contactUs: contactUs ?? _contactUs,
      );
  int? get status => _status;
  bool? get success => _success;
  String? get requestDate => _requestDate;
  String? get msg => _msg;
  ContactUs? get contactUs => _contactUs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['request_date'] = _requestDate;
    map['msg'] = _msg;
    if (_contactUs != null) {
      map['contactUs'] = _contactUs?.toJson();
    }
    return map;
  }
}

/// id : 1
/// email_one : "info@albausalah.com"
/// email_two : "info@albausalah.com"
/// mobile : "+964 1800 33355"
/// whatsapp_number : "+964 9595959"
/// support_email_one : "info@albausalah.com"
/// support_email_two : "info@albausalah1.com"
/// support_mobile_one : "+964 1800 3335566"
/// support_mobile_two : "+964 1800 3335566"
/// address : "جميع أنحاء العراق"
/// facebook_url : "https://www.facebook.com/"
/// twitter_url : "https://www.twitter.com/"
/// instagram_url : "https://www.instagram.com/"
/// youtube_url : "https://www.youtube.com/"
/// created_at : "2023-07-10T11:54:59.000000Z"
/// updated_at : "2023-07-10T11:54:59.000000Z"

ContactUs contactUsFromJson(String str) => ContactUs.fromJson(json.decode(str));
String contactUsToJson(ContactUs data) => json.encode(data.toJson());

class ContactUs {
  ContactUs({
    int? id,
    String? emailOne,
    String? emailTwo,
    String? mobile,
    String? whatsappNumber,
    String? supportEmailOne,
    String? supportEmailTwo,
    String? supportMobileOne,
    String? supportMobileTwo,
    String? address,
    String? facebookUrl,
    String? twitterUrl,
    String? instagramUrl,
    String? youtubeUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _emailOne = emailOne;
    _emailTwo = emailTwo;
    _mobile = mobile;
    _whatsappNumber = whatsappNumber;
    _supportEmailOne = supportEmailOne;
    _supportEmailTwo = supportEmailTwo;
    _supportMobileOne = supportMobileOne;
    _supportMobileTwo = supportMobileTwo;
    _address = address;
    _facebookUrl = facebookUrl;
    _twitterUrl = twitterUrl;
    _instagramUrl = instagramUrl;
    _youtubeUrl = youtubeUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ContactUs.fromJson(dynamic json) {
    _id = json['id'];
    _emailOne = json['email_one'];
    _emailTwo = json['email_two'];
    _mobile = json['mobile'];
    _whatsappNumber = json['whatsapp_number'];
    _supportEmailOne = json['support_email_one'];
    _supportEmailTwo = json['support_email_two'];
    _supportMobileOne = json['support_mobile_one'];
    _supportMobileTwo = json['support_mobile_two'];
    _address = json['address'];
    _facebookUrl = json['facebook_url'];
    _twitterUrl = json['twitter_url'];
    _instagramUrl = json['instagram_url'];
    _youtubeUrl = json['youtube_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _emailOne;
  String? _emailTwo;
  String? _mobile;
  String? _whatsappNumber;
  String? _supportEmailOne;
  String? _supportEmailTwo;
  String? _supportMobileOne;
  String? _supportMobileTwo;
  String? _address;
  String? _facebookUrl;
  String? _twitterUrl;
  String? _instagramUrl;
  String? _youtubeUrl;
  String? _createdAt;
  String? _updatedAt;
  ContactUs copyWith({
    int? id,
    String? emailOne,
    String? emailTwo,
    String? mobile,
    String? whatsappNumber,
    String? supportEmailOne,
    String? supportEmailTwo,
    String? supportMobileOne,
    String? supportMobileTwo,
    String? address,
    String? facebookUrl,
    String? twitterUrl,
    String? instagramUrl,
    String? youtubeUrl,
    String? createdAt,
    String? updatedAt,
  }) =>
      ContactUs(
        id: id ?? _id,
        emailOne: emailOne ?? _emailOne,
        emailTwo: emailTwo ?? _emailTwo,
        mobile: mobile ?? _mobile,
        whatsappNumber: whatsappNumber ?? _whatsappNumber,
        supportEmailOne: supportEmailOne ?? _supportEmailOne,
        supportEmailTwo: supportEmailTwo ?? _supportEmailTwo,
        supportMobileOne: supportMobileOne ?? _supportMobileOne,
        supportMobileTwo: supportMobileTwo ?? _supportMobileTwo,
        address: address ?? _address,
        facebookUrl: facebookUrl ?? _facebookUrl,
        twitterUrl: twitterUrl ?? _twitterUrl,
        instagramUrl: instagramUrl ?? _instagramUrl,
        youtubeUrl: youtubeUrl ?? _youtubeUrl,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get emailOne => _emailOne;
  String? get emailTwo => _emailTwo;
  String? get mobile => _mobile;
  String? get whatsappNumber => _whatsappNumber;
  String? get supportEmailOne => _supportEmailOne;
  String? get supportEmailTwo => _supportEmailTwo;
  String? get supportMobileOne => _supportMobileOne;
  String? get supportMobileTwo => _supportMobileTwo;
  String? get address => _address;
  String? get facebookUrl => _facebookUrl;
  String? get twitterUrl => _twitterUrl;
  String? get instagramUrl => _instagramUrl;
  String? get youtubeUrl => _youtubeUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email_one'] = _emailOne;
    map['email_two'] = _emailTwo;
    map['mobile'] = _mobile;
    map['whatsapp_number'] = _whatsappNumber;
    map['support_email_one'] = _supportEmailOne;
    map['support_email_two'] = _supportEmailTwo;
    map['support_mobile_one'] = _supportMobileOne;
    map['support_mobile_two'] = _supportMobileTwo;
    map['address'] = _address;
    map['facebook_url'] = _facebookUrl;
    map['twitter_url'] = _twitterUrl;
    map['instagram_url'] = _instagramUrl;
    map['youtube_url'] = _youtubeUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
