import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/api/ProductDetails/TrendingApi.dart';
import 'package:fursan_cart/repository/api/ProductDetails/bestoffersProductApi.dart';
import 'package:meta/meta.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  late List<ProductDetailsModel> productDetailsModel;
  // late List<ProductDetailsModel>  Tranding;
  // late List<ProductDetailsModel> non ;
  ProductDetailsApi productDetailsApi;
  BestoffersProductApi bestoffersProductApi;
  ProductDetailsBloc(this.productDetailsApi,this.bestoffersProductApi) : super(ProductDetailsInitial()) {
    on<FatchProductDetails>((event, emit) async {
      emit(ProductDetailsLoading());
      try {
        productDetailsModel = await productDetailsApi.getProductDetails();
        // Tranding=productDetailsModel.where((element) => element.tags == null).toList();
        // non=productDetailsModel.where((element) => element.tags != null).toList();
        emit(ProductDetailsLoaded());
      } catch (e) {
        print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
        emit(ProductDetailsError());
      }

      // TODO: implement event handler

      on<FatchBestoffersProduct>((event, emit) async {
        emit(ProductDetailsLoading());
        try {
          productDetailsModel =
          await bestoffersProductApi.getBestoffersProduct();
          // Tranding=productDetailsModel.where((element) => element.tags == null).toList();
          // non=productDetailsModel.where((element) => element.tags != null).toList();
          emit(ProductDetailsLoaded());
        } catch (e) {
          print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
          emit(ProductDetailsError());
        }

        // TODO: implement event handler
      }
      );}
      );
  }
}
