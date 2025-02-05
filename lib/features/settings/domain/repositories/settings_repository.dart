import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';

abstract class SettingsRepository {
  Future<Either> getFavouriteProducts();

  Future<Either> signOut();

  Future<Either> addAddress(AddressEntity address);

  Future<Either> getAddresses();
  Future<Either> deleteAddress(String id);
}
