import 'package:albausalah_app/shared/components/widgets/lib/chatview.dart';

import '../../../../view/account/pages/edit_information_for_customer/model/my_information_model.dart';

int guestBottomNavIndex = 0; //default index of a first screen

ChatUser userInfo = ChatUser(id: '-1', name: '', profilePhoto: '');
MyInformationModel? myInformationModel = MyInformationModel();

class ConstantData {
  ConstantData._();

  static const double _heightSpace = 15.0;
  static const String _appID = '8c916984-2cc9-427e-abfa-e8f927248b4f';

  static double get heightSpace => _heightSpace;

  static String get appID => _appID;
}

class ReceiverData {
  String? _receiverId;

  ReceiverData._privateConstructor();

  static final ReceiverData _instance = ReceiverData._privateConstructor();

  static ReceiverData get instance => _instance;

  String? get receiverId => _receiverId;

  set receiverId(String? value) {
    _receiverId = value;
  }
}

class FlagSingleton {
  bool? _flag = false;

  // Private constructor
  FlagSingleton._privateConstructor();

  // Singleton instance
  static final FlagSingleton _instance = FlagSingleton._privateConstructor();

  // Getter for the instance
  static FlagSingleton get instance => _instance;

  bool? get getFlag => _flag;

  set setFlag(bool? value) {
    _flag = value;
  }
}
