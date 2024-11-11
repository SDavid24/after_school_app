
import 'dart:convert';

import 'package:after_school_app/common/models/entities.dart';
import 'package:after_school_app/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;

  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpenStatus() {
    return  _pref.getBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST_KEY) ?? false;
  }

  bool isLoggedIn(){
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) != null ? true : false;
  }

  UserProfile getUserProfile(){ //Get the user profile in json format so it can be used individually
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);

    return userProfile;
  }
}
