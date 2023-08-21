import 'dart:convert';

ChatDetailsModel chatDetailsModelFromJson(String str) =>
    ChatDetailsModel.fromJson(json.decode(str));
String chatDetailsModelToJson(ChatDetailsModel data) =>
    json.encode(data.toJson());

class ChatDetailsModel {
  ChatDetailsModel({
    bool? status,
    String? errNum,
    String? msg,
    List<MessageDetails>? messageDetails,
  }) {
    _status = status;
    _errNum = errNum;
    _msg = msg;
    _messageDetails = messageDetails;
  }

  ChatDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _errNum = json['errNum'];
    _msg = json['msg'];
    if (json['messageDetails'] != null) {
      _messageDetails = [];
      json['messageDetails'].forEach((v) {
        _messageDetails?.add(MessageDetails.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _errNum;
  String? _msg;
  List<MessageDetails>? _messageDetails;
  ChatDetailsModel copyWith({
    bool? status,
    String? errNum,
    String? msg,
    List<MessageDetails>? messageDetails,
  }) =>
      ChatDetailsModel(
        status: status ?? _status,
        errNum: errNum ?? _errNum,
        msg: msg ?? _msg,
        messageDetails: messageDetails ?? _messageDetails,
      );
  bool? get status => _status;
  String? get errNum => _errNum;
  String? get msg => _msg;
  List<MessageDetails>? get messageDetails => _messageDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['errNum'] = _errNum;
    map['msg'] = _msg;
    if (_messageDetails != null) {
      map['messageDetails'] = _messageDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 52
/// message_id : 5
/// sender_id : 1
/// receiver_id : 2
/// message_details : "hi"
/// product_id : 8
/// delete_type : ""
/// read_at : ""
/// created_at : "2023-06-07T08:48:13.000000Z"
/// updated_at : "2023-06-07T08:48:13.000000Z"
/// product_image : ""
/// product_name : ""
/// suggested_price : ""
/// other_media_message : [{"id":27,"message_operation_id":54,"message_file":"https://al-bausalah.com/storage/messages_files/1768041510947606.mp4","file_type":"Video","created_at":"2023-06-07T11:02:59.000000Z","updated_at":"2023-06-07T11:02:59.000000Z"}]

MessageDetails messageDetailsFromJson(String str) =>
    MessageDetails.fromJson(json.decode(str));
String messageDetailsToJson(MessageDetails data) => json.encode(data.toJson());

class MessageDetails {
  MessageDetails({
    int? id,
    int? messageId,
    int? senderId,
    int? receiverId,
    String? messageDetails,
    int? productId,
    String? deleteType,
    String? readAt,
    String? createdAt,
    String? updatedAt,
    String? productImage,
    String? productName,
    String? suggestedPrice,
    List<OtherMediaMessage>? otherMediaMessage,
  }) {
    _id = id;
    _messageId = messageId;
    _senderId = senderId;
    _receiverId = receiverId;
    _messageDetails = messageDetails;
    _productId = productId;
    _deleteType = deleteType;
    _readAt = readAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productImage = productImage;
    _productName = productName;
    _suggestedPrice = suggestedPrice;
    _otherMediaMessage = otherMediaMessage;
  }

  MessageDetails.fromJson(dynamic json) {
    _id = json['id'];
    _messageId = json['message_id'];
    _senderId = json['sender_id'];
    _receiverId = json['receiver_id'];
    _messageDetails = json['message_details'];
    _productId = json['product_id'];
    _deleteType = json['delete_type'];
    _readAt = json['read_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _productImage = json['product_image'];
    _productName = json['product_name'];
    _suggestedPrice = json['suggested_price'];
    if (json['other_media_message'] != null) {
      _otherMediaMessage = [];
      json['other_media_message'].forEach((v) {
        _otherMediaMessage?.add(OtherMediaMessage.fromJson(v));
      });
    }
  }
  int? _id;
  int? _messageId;
  int? _senderId;
  int? _receiverId;
  String? _messageDetails;
  int? _productId;
  String? _deleteType;
  String? _readAt;
  String? _createdAt;
  String? _updatedAt;
  String? _productImage;
  String? _productName;
  String? _suggestedPrice;
  List<OtherMediaMessage>? _otherMediaMessage;
  MessageDetails copyWith({
    int? id,
    int? messageId,
    int? senderId,
    int? receiverId,
    String? messageDetails,
    int? productId,
    String? deleteType,
    String? readAt,
    String? createdAt,
    String? updatedAt,
    String? productImage,
    String? productName,
    String? suggestedPrice,
    List<OtherMediaMessage>? otherMediaMessage,
  }) =>
      MessageDetails(
        id: id ?? _id,
        messageId: messageId ?? _messageId,
        senderId: senderId ?? _senderId,
        receiverId: receiverId ?? _receiverId,
        messageDetails: messageDetails ?? _messageDetails,
        productId: productId ?? _productId,
        deleteType: deleteType ?? _deleteType,
        readAt: readAt ?? _readAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        productImage: productImage ?? _productImage,
        productName: productName ?? _productName,
        suggestedPrice: suggestedPrice ?? _suggestedPrice,
        otherMediaMessage: otherMediaMessage ?? _otherMediaMessage,
      );
  int? get id => _id;
  int? get messageId => _messageId;
  int? get senderId => _senderId;
  int? get receiverId => _receiverId;
  String? get messageDetails => _messageDetails;
  int? get productId => _productId;
  String? get deleteType => _deleteType;
  String? get readAt => _readAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get productImage => _productImage;
  String? get productName => _productName;
  String? get suggestedPrice => _suggestedPrice;
  List<OtherMediaMessage>? get otherMediaMessage => _otherMediaMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message_id'] = _messageId;
    map['sender_id'] = _senderId;
    map['receiver_id'] = _receiverId;
    map['message_details'] = _messageDetails;
    map['product_id'] = _productId;
    map['delete_type'] = _deleteType;
    map['read_at'] = _readAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['product_image'] = _productImage;
    map['product_name'] = _productName;
    map['suggested_price'] = _suggestedPrice;
    if (_otherMediaMessage != null) {
      map['other_media_message'] =
          _otherMediaMessage?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 27
/// message_operation_id : 54
/// message_file : "https://al-bausalah.com/storage/messages_files/1768041510947606.mp4"
/// file_type : "Video"
/// created_at : "2023-06-07T11:02:59.000000Z"
/// updated_at : "2023-06-07T11:02:59.000000Z"

OtherMediaMessage otherMediaMessageFromJson(String str) =>
    OtherMediaMessage.fromJson(json.decode(str));
String otherMediaMessageToJson(OtherMediaMessage data) =>
    json.encode(data.toJson());

class OtherMediaMessage {
  OtherMediaMessage({
    int? id,
    int? messageOperationId,
    String? messageFile,
    String? fileType,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _messageOperationId = messageOperationId;
    _messageFile = messageFile;
    _fileType = fileType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  OtherMediaMessage.fromJson(dynamic json) {
    _id = json['id'];
    _messageOperationId = json['message_operation_id'];
    _messageFile = json['message_file'];
    _fileType = json['file_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _messageOperationId;
  String? _messageFile;
  String? _fileType;
  String? _createdAt;
  String? _updatedAt;
  OtherMediaMessage copyWith({
    int? id,
    int? messageOperationId,
    String? messageFile,
    String? fileType,
    String? createdAt,
    String? updatedAt,
  }) =>
      OtherMediaMessage(
        id: id ?? _id,
        messageOperationId: messageOperationId ?? _messageOperationId,
        messageFile: messageFile ?? _messageFile,
        fileType: fileType ?? _fileType,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  int? get messageOperationId => _messageOperationId;
  String? get messageFile => _messageFile;
  String? get fileType => _fileType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message_operation_id'] = _messageOperationId;
    map['message_file'] = _messageFile;
    map['file_type'] = _fileType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
