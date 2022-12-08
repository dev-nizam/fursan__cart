part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class FetchSearch extends SearchEvent {
  final String products;

  FetchSearch(this.products);
}
