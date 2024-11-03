import 'package:after_school_app/pages/sign_in/provider/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//State notifier saves state
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier(): super(const SignInState());

  //Notifiers for sign in change text changes - Instead of using textControllers
  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password){
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref) => SignInNotifier());