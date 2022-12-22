part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}
class FatchBestoffersProduct extends ProductDetailsEvent{
  String subid;
  String tag;

  FatchBestoffersProduct({required this.tag,required this.subid,});
}
class FatchBrandProduct extends ProductDetailsEvent{
  String Brandid;
  FatchBrandProduct({required this.Brandid});
}