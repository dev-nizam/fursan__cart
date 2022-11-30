import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/user/SignupModel.dart';
import 'package:fursan_cart/repository/api/authentication/signup.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late SignupModel signupModel;
  ApiSignUp apiSignUp;
  SignupBloc(this.apiSignUp) : super(SignupInitial()) {
    on<FetchSignUp>((event, emit)async {
      // TODO: implement event handler
      print("loading....");
      emit(SignupLoading());
      try {
        signupModel = await apiSignUp.getSignup(
            email: event.email, password: event.password, username:event.userName);
        print("loaded.....");
        //  modelClassToken = await userToken.getLoginFunction();
        // preference.setString('token', SignupModel!.tokens!.accessToken!);
        // preference.setString('userId', signinModel!.user!.id.toString());
        //print("OOOOOOOOOO" + modelClassToken!.tokens!.accessToken!);

        emit(SignupLoaded());
      } catch (e) {
        print("***********$e");
        emit(SignupError());
      }
    });
  }
}
