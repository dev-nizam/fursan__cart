import 'package:bloc/bloc.dart';

import 'package:fursan_cart/model/category/CatogeryModel.dart';
import 'package:fursan_cart/repository/api/category/CatogeryApi.dart';
import 'package:meta/meta.dart';

part 'catogery_event.dart';
part 'catogery_state.dart';

class CatogeryBloc extends Bloc<CatogeryEvent, CatogeryState> {
  late List<CatogeryModel> catogeryModel;
  CatogeryApi catogeryApi;
  CatogeryBloc(this.catogeryApi) : super(CatogeryInitial()) {
    on<FetchCatogery>((event, emit) async {
      emit(CatogeryLoading());
      try {
        catogeryModel = await catogeryApi.getCatogery();
        emit(CatogeryLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(CatogeryError());
      }

      // TODO: implement event handler
    });
  }
}
