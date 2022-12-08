import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/api/brand/brandIdApi.dart';
import 'package:meta/meta.dart';

part 'brandid_event.dart';
part 'brandid_state.dart';

class BrandidBloc extends Bloc<BrandidEvent, BrandidState> {
  late List<ProductDetailsModel> productDetailsModel;
  ApiBrandId apiBrandId;
  BrandidBloc(this.apiBrandId) : super(BrandidInitial()) {
    on<FatchBrandId>((event, emit) async {
      emit(BrandIdLoading());
      print("brand loading>>>>>");
      try {
        productDetailsModel = await apiBrandId.getBrandId();
        emit(BrandIdLoaded());
        print("brand loaded>>>>>");
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(BrandIdError());
      }

      // TODO: implement event handler
    });
  }
}


