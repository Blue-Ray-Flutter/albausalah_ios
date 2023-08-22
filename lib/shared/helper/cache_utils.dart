import 'package:get_storage/get_storage.dart';

class CacheUtils {
  final GetStorage _storage;

  CacheUtils(this._storage);

  static const _photoUrl = 'photo';
  static const _userTypeKey = 'userType';
  static const _tokenKey = 'token';
  static const _nameKey = 'name';
  static const _languageKey = 'language_key';
  static const _emailKey = 'email';
  static const _phoneKey = 'phone';
  static const _uidKey = 'uid';
  static const _countryIdKey = 'countryId';
  static const _countryNameKey = 'countryName';
  static const _planIdKey = 'planId';
  static const _systemIdsKey = 'systemIds';
  static const _yearKey = 'year';
  static const _universityIdKey = 'universityId';
  static const _contentCreatorKey = 'universityId';
  static const _paymentStatusKey = 'universityId';
  static const _statusKey = 'status';
  static const _flag = 'true';

  Future<void> saveFlag({
    required bool flag,
  }) async {
    _storage.write(_flag, flag);
  }

  static get getFlag => _flag;

  bool isUserLoggedIn() {
    return _storage.hasData(_tokenKey);
  }

  String? getToken() {
    return _storage.read(_tokenKey);
  }

  String? getLanguage() {
    return _storage.read(_languageKey);
  }

  String? getPhoto() {
    return _storage.read(_photoUrl);
  }

  String? getUserType() {
    return _storage.read(_userTypeKey);
  }

  String? getName() {
    return _storage.read(_nameKey);
  }

  String? getEmail() {
    return _storage.read(_emailKey);
  }

  String? getPhone() {
    return _storage.read(_phoneKey);
  }

  String? getCountryId() {
    return _storage.read(_countryIdKey);
  }

  String? getCountryName() {
    return _storage.read(_countryNameKey);
  }

  String? getPlanId() {
    return _storage.read(_planIdKey);
  }

  String? getSystemIds() {
    return _storage.read(_systemIdsKey);
  }

  String? getYear() {
    return _storage.read(_yearKey);
  }

  String? getUniversityId() {
    return _storage.read(_universityIdKey);
  }

  String? getContentCreator() {
    return _storage.read(_contentCreatorKey);
  }

  String? getPaymentStatus() {
    return _storage.read(_paymentStatusKey);
  }

  String? getStatus() {
    return _storage.read(_statusKey);
  }

  int? getUID() {
    return _storage.read(_uidKey);
  }

  Future<void> savePhoto({
    required String photo,
  }) async {
    _storage.write(_photoUrl, photo);
  }

  Future<void> saveLanguage({
    required String language,
  }) async {
    _storage.write(_languageKey, language);
  }

  Future<void> login({
    required String token,
    required String userType,
    required int uid,
    required String name,
    required String email,
    required String phone,
  }) async {
    _storage.write(_tokenKey, token);
    _storage.write(_nameKey, name);
    _storage.write(_emailKey, email);
    _storage.write(_phoneKey, phone);
    _storage.write(_userTypeKey, userType);
    _storage.write(_uidKey, uid);
  }

  Future<void> signUpContentCreator({
    required String token,
    required String name,
    required String email,
    required String phone,
    required String countryId,
    required String year,
    required String contentCreator,
    required String status,
  }) async {
    _storage.write(_tokenKey, token);
    _storage.write(_nameKey, name);
    _storage.write(_emailKey, email);
    _storage.write(_phoneKey, phone);
    _storage.write(_countryIdKey, countryId);
    _storage.write(_yearKey, year);
    _storage.write(_contentCreatorKey, contentCreator);
    _storage.write(_statusKey, status);
  }

  Future<void> logout() async {
    _storage.remove(_tokenKey);
    _storage.erase();
  }
}
