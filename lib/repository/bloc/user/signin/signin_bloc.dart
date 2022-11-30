import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/user/SigninModel.dart';
import 'package:fursan_cart/repository/api/authentication/login.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
 late SigninModel signinModel;
  ApiLogin apiLogin;
  SigninBloc(this.apiLogin) : super(SigninInitial()) {
    on<FetchLogin>((event, emit)async {
      // TODO: implement event handler
      print("loading....");
      emit(SigninLoading());
      try {
        signinModel = await apiLogin.getLogin(Email: event.Email, password:event.password
            );
        print("loaded.....");
        //  modelClassToken = await userToken.getLoginFunction();
        // preference.setString('token', SigninModel!.tokens!.accessToken!);
        // preference.setString('userId', signinModel!.user!.id.toString());
        //print("OOOOOOOOOO" + modelClassToken!.tokens!.accessToken!);

        emit(SigninLoaded());
      } catch (e) {
        print("***********$e");
        emit(SigninError());
      }
    });
  }
}
