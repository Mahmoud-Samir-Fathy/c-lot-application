import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetProductsRepository{
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getAllProducts(String title);
  Future <Either> setToFavourite(ProductEntity product);
  Future <bool> isFavourite(String productId);
}