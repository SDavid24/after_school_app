import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'application_nav_notifier.g.dart';

@riverpod
class ApplicationNavIndex extends _$ApplicationNavIndex {
  @override
  int build()  {
    return 0;
  }

  void changeIndex(int navIndex){ //Monitors the index of the nav bar
    state = navIndex;
  }
}