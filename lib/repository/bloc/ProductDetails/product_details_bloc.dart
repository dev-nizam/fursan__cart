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
  BestoffersProductApi bestoffersProductApi;
  ProductDetailsBloc(this.bestoffersProductApi) : super(ProductDetailsInitial()) {


      on<FatchBestoffersProduct>((event, emit) async {
        emit(ProductDetailsLoading());
        try {
          productDetailsModel =
          await bestoffersProductApi.getBestoffersProduct(
              event.tag, event.subid,);
          // Tranding=productDetailsModel.where((element) => element.tags == null).toList();
          // non=productDetailsModel.where((element) => element.tags != null).toList();
          emit(ProductDetailsLoaded());
        } catch (e) {
          print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
          emit(ProductDetailsError());
        }

        // TODO: implement event handler
      }
      );on<FatchBrandProduct>((event, emit) async {
        emit(ProductDetailsLoading());
        try {
          productDetailsModel =
          await bestoffersProductApi.getBrandProduct(
            event.Brandid,);
          // Tranding=productDetailsModel.where((element) => element.tags == null).toList();
          // non=productDetailsModel.where((element) => element.tags != null).toList();
          emit(ProductDetailsLoaded());
        } catch (e) {
          print(">>>>>>>>>>>>>>>>>$e>>>>>>>>");
          emit(ProductDetailsError());
        }

        // TODO: implement event handler
      }
      );
    }}




