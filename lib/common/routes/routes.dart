import 'package:after_school_app/common/routes/app_routes_names.dart';
import 'package:after_school_app/global.dart';
import 'package:after_school_app/pages/application/view/application.dart';
import 'package:after_school_app/pages/sign_up/view/sign_up.dart';
import 'package:after_school_app/pages/welcome/view/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../pages/home/view/home.dart';
import '../../pages/sign_in/view/sign_in.dart';

class AppPages{
  static List<RouteEntity> routes(){

    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
    ];
  }

  static MaterialPageRoute? generateRouteSettings(RouteSettings settings){
    if (kDebugMode) {
      print('My route name is ${settings.name}');
    }
    print('Global.storageService.isLoggedIn():  ${Global.storageService.isLoggedIn()}');



    if(settings.name != null){
      var result = routes().where((element) => element.path == settings.name);
      if(result.isNotEmpty){
        bool deviceFirstTIme = Global.storageService.getDeviceFirstOpenStatus();
        print('deviceFirstTIme: $deviceFirstTIme');
        print('result.first.path : ${result.first.path }');

        if(result.first.path ==AppRoutesNames.WELCOME && deviceFirstTIme){ //If you have gotten to the last Welcome screen after fresh install, Always show SignIn page afterwards
          if(Global.storageService.isLoggedIn()){ //If it is logged in, default to home page
            return MaterialPageRoute(
              builder: (_) => Application(), settings: settings,);
          }else {
            return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings,);
          }

        }else{
          print('App ran first time');
          print('result.first.page ${result.first.page}' );

          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings,);

        }
      }
     // if(result.first.p) // use the result. even though it will only return 1
    }
    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings,);

  }


}

class RouteEntity{
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}