import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetFavouriteStates{}
class GetFavouriteInitialState extends GetFavouriteStates{}
class GetFavouriteLoadingState extends GetFavouriteStates{}
class GetFavouriteSuccessState extends GetFavouriteStates{
  final List<ProductEntity> favourites;

  GetFavouriteSuccessState({required this.favourites});
}
class GetFavouriteErrorState extends GetFavouriteStates{
  final String message;

  GetFavouriteErrorState({required this.message});
}