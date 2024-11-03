import 'package:after_school_app/common/services/storage.dart';
import 'package:after_school_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Global{
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();  // Make sure to initialize binding here
    await Firebase.initializeApp();

    storageService = await StorageService().init();
  }

}