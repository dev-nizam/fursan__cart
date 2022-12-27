import 'dart:async';



import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/repository/api/banner/bannerApi.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
 late List<BannerModel> bannerModel;
 late List<BannerModel> bestOffers;
 late List<BannerModel> bannerimg ;
 ApiBanner apiBanner=ApiBanner();
  BannerBloc() : super(BannerInitial()) {
    on<FetchBanner>((event, emit) async {
      emit(BannerLoading());
      try {
        bannerModel = await apiBanner.getBanner();
        bestOffers=bannerModel.where((element) => element.tag != null).toList();
        bannerimg=bannerModel.where((element) => element.tag == null).toList();
        emit(BannerLoaded());
      } catch (e) {
        // print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(BannerError());
      }

      // TODO: implement event handler
    });
  }
}
