import 'package:dartz/dartz.dart';

abstract class GetProductsRepository{
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getAllProducts(String title);
}