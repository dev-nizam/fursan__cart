import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fursan_cart/model/user/SigninModel.dart';
import 'package:fursan_cart/repository/api/authentication/firbase/facebook.dart';
import 'package:fursan_cart/repository/api/authentication/firbase/googel.dart';
import 'package:fursan_cart/repository/api/authentication/login.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
   Facebook facebook;
   Google google;
 late SigninModel signinModel;
  ApiLogin apiLogin;
  SigninBloc(this.apiLogin ,this.google,this.facebook) : super(SigninInitial()) {
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
    on<FacebookLogin>((event, emit) async {

      emit(SigninLoading());

      try {
        await facebook.signInWithFacebook();
        emit(SigninLoaded());
      } catch (e) {
        print(e);
        emit(SigninError());
        print("Error>>>>>>>>>>>>>>>>>>>>>" + e.toString());
      }
    });

    on<GoogleLogin>((event, emit) async {
      emit(SigninLoading());

      try {
        await google.signInWithGoogle();
        emit(SigninLoaded());
        print("google loaded");
      } catch (e) {
        print(e);
        emit(SigninError());
        print("Error>>>>>>>>>>>>>>>>>>>>>" + e.toString());
      }
    });
  }
}
