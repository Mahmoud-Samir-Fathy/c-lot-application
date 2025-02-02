import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class SettingsStates{}
class GetFavouriteInitialState extends SettingsStates{}
class GetFavouriteLoadingState extends SettingsStates{}
class GetFavouriteSuccessState extends SettingsStates{
  final List<ProductEntity> favourites;

  GetFavouriteSuccessState({required this.favourites});
}
class GetFavouriteErrorState extends SettingsStates{
  final String message;

  GetFavouriteErrorState({required this.message});
}
class SignOutSuccessState extends SettingsStates{}
class SignOutErrorState extends SettingsStates{
  final String message;

  SignOutErrorState({required this.message});
}