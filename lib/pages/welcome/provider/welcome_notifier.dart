import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'welcome_notifier.g.dart';

@riverpod
class IndexDot extends _$IndexDot {
  @override
  int build() {
    return 0;
  }

  //Method that changes the dot position
  void changeValue(int value){
    state = value;
  }
}