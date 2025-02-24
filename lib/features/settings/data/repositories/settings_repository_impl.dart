import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/settings/data/data_sources/fire_base_settings_data_source.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final FireBaseSettingsDataSource fireBaseSettingsDataSource;

  SettingsRepositoryImpl({required this.fireBaseSettingsDataSource});

  @override
  Future<Either> getFavouriteProducts() async {
    var data = await fireBaseSettingsDataSource.getFavouriteProducts();
    return data.fold((error) => Left(error), (response) {
      if (response == null || (response as List).isEmpty) {
        return Left(Exception('No Products found.'));
      }
      try {
        final products = (response)
            .map((product) => ProductEntity.fromJson(product))
            .toList();
        return Right(products);
      } catch (e) {
        return Left(Exception('Failed to parse products: $e'));
      }
    });
  }

  @override
  Future<Either> signOut() async {
    return await fireBaseSettingsDataSource.signOut();
  }

  @override
  Future<Either> addAddress(AddressEntity address) async {
    var data = await fireBaseSettingsDataSource.addAddress(address);

    try {
      return Right(data);
    } catch (e) {
      return Left(Exception('Failed to parse products: $e'));
    }
  }

  @override
  Future<Either> getAddresses() async {
    return await fireBaseSettingsDataSource.getAddresses();
  }

  @override
  Future<Either> deleteAddress(String id) async{
    var user = await fireBaseSettingsDataSource.deleteAddress(id);

    return user.fold((error) => Left(error), (response) => Right(response));
  }
}
