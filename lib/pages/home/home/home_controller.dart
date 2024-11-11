import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build()  {
    return 0;
  }

  //Method that changes the dot position
  void changeValue(int value){
    state = value;
  }
}