part of 'brand_bloc.dart';

@immutable
abstract class BrandEvent {}
class FatchBrand extends BrandEvent{
  late String image;
}
