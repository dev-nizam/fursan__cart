import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:meta/meta.dart';

import '../../api/ProductDetails/TrendingApi.dart';

part 'tranding_event.dart';
part 'tranding_state.dart';

class TrandingBloc extends Bloc<TrandingEvent, TrandingState> {
  late List<ProductDetailsModel> productDetailsModel;
  ProductDetailsApi productDetailsApi;
  TrandingBloc(this.productDetailsApi) : super(TrandingInitial()) {
    on<TrandingEvent>((event, emit)async {
      // TODO: implement event handler
      emit(TrandingLoading());
      try {
        productDetailsModel =
            await productDetailsApi.gettrending();

        emit(TrandingLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(TrandingError());
      }
    });
  }
}
