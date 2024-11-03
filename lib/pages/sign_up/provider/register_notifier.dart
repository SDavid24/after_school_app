import 'package:after_school_app/pages/sign_up/provider/register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {

  @override
  RegisterState build() {
    return RegisterState();
  }

  //Notifiers for sign up change text changes - Instead of using textControllers
  void onUserNameChange(String name){
    state = state.copyWith(userName: name);
  }

  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password){
    state = state.copyWith(password: password);
  }

  void onRePasswordChange(String password){
    state = state.copyWith(rePassword: password);
  }
}