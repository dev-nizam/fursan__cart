import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/profile/ProfileModel.dart';
import 'package:fursan_cart/repository/api/profile/ProfilApi.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileModel profileModel;
 ApiProfile apiProfile =ApiProfile();
  ProfileBloc() : super(ProfileInitial()) {
    on<FatchProfile>((event, emit)async {
      emit(ProfileLoading());
      try {
        profileModel =
            await apiProfile.getProfil(event.id);
        emit(ProfileLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProfileError());
      }

      // TODO: implement event handler
    }
    );
    on<FatchProfileEditusername>((event, emit)async {
      emit(ProfileEditLoading());
      try {
        profileModel =
        await apiProfile.getProfileEditusername(username: event.username,);
        emit(ProfileEditLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProfileEditError());
      }

      // TODO: implement event handler
    }
    );
    on<FatchProfileEditphone>((event, emit)async {
      emit(ProfileEditLoading());
      try {
        profileModel =
        await apiProfile.getProfileEditphone( phone:event.phone, );
        emit(ProfileEditLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProfileEditError());
      }

      // TODO: implement event handler
    }
    );
    on<FatchProfileEditemail>((event, emit)async {
      emit(ProfileEditLoading());
      try {
        profileModel =
        await apiProfile.getProfileEditemail( email: event.email);
        emit(ProfileEditLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProfileEditError());
      }

      // TODO: implement event handler
    }
    );
  }

}
