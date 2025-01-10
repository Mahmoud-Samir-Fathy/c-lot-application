import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_product_data_source.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';

class GetProductsRepositoryImpl implements GetProductsRepository {
  final FireBaseGetProductDataSource fireBaseGetProductDataSource;

  GetProductsRepositoryImpl({required this.fireBaseGetProductDataSource});

  @override
  Future<Either> getTopSellingProducts() async {
    var data = await fireBaseGetProductDataSource.getTopSellingProducts();
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
  Future<Either> getNewInProducts() async {
    var data = await fireBaseGetProductDataSource.getNewInProducts();
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
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var data =
        await fireBaseGetProductDataSource.getProductsByCategoryId(categoryId);
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
  Future<Either> getAllProducts(String title) async {
    var data = await fireBaseGetProductDataSource.getAllProducts(title);
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
  Future<Either> setToFavourite(ProductEntity product) async {
    var data = await fireBaseGetProductDataSource.setToFavourite(product);
    return data.fold((error) =>  const Left(Error), (data) => Right(data));
  }



  @override
  Future<bool> isFavourite(String productId) async{
    return await fireBaseGetProductDataSource.isFavourite(productId);
  }

  @override
  Future<Either> getFavouriteProducts() {
    // TODO: implement getFavouriteProducts
    throw UnimplementedError();
  }
}
