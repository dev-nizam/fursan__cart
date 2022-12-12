import 'package:bloc/bloc.dart';
import 'package:fursan_cart/model/search/SearchModel.dart';
import 'package:fursan_cart/repository/api/search%20api/SearchApi.dart';
import 'package:meta/meta.dart';



part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late List<SearchModel> searchModel;
  SearchApi searchApi;
  SearchBloc(this.searchApi) : super(SearchInitial()) {
    on<FetchSearch>((event, emit) async {
      emit(SearchLoading());
      try {
        searchModel = await searchApi.getSearch(event.Id);
        emit(SearchLoaded());
      } catch (e) {
        emit(SearchError());
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
      }
    });
  }
}
