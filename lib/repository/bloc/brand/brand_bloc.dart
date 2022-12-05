import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/brand/BrandModel.dart';
import 'package:fursan_cart/repository/api/brand/brandApi.dart';
import 'package:meta/meta.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  late List<BrandModel> brandModel;
  ApiBrand apiBrand;

  BrandBloc(this.apiBrand) : super(BrandInitial()) {
    on<FatchBrand>((event, emit) async {
      emit(BrandLoading());
      print("brand loading>>>>>");
      try {
        brandModel = await apiBrand.getBrand();
        emit(BrandLoaded());
        print("brand loaded>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(BrandError());
      }

      // TODO: implement event handler
    });
  }
}
