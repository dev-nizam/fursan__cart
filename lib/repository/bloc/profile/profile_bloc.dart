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
    on<FatchProfileEdit>((event, emit)async {
      emit(ProfileLoading());
      try {
        profileModel =
        await apiProfile.getProfileEdit(event.id);
        emit(ProfileLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProfileError());
      }

      // TODO: implement event handler
    }
    );
  }

}
