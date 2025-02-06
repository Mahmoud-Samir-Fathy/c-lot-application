import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';

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

class AddAddressLoadingState extends SettingsStates{}
class AddAddressSuccessState extends SettingsStates{}
class AddAddressErrorState extends SettingsStates{
  final String message;

  AddAddressErrorState({required this.message});
}

class GetAddressLoadingState extends SettingsStates{}
class GetAddressSuccessState extends SettingsStates{
  final List<AddressEntity> address;

  GetAddressSuccessState({required this.address});
}
class GetAddressErrorState extends SettingsStates{
  final String message;

  GetAddressErrorState({required this.message});
}
class DeleteAddressLoadingState extends SettingsStates{}
class DeleteAddressSuccessState extends SettingsStates{}
class DeleteAddressErrorState extends SettingsStates{
  final String message;

  DeleteAddressErrorState({required this.message});
}