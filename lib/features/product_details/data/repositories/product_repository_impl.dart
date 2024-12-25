import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/product_details/data/data_sources/fire_base_product_data_source.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/features/product_details/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FireBaseProductDataSource fireBaseProductDataSource;

  ProductRepositoryImpl({required this.fireBaseProductDataSource});

  @override
  Future<Either> addToCart(AddToCartEntity addToCart) {
    return fireBaseProductDataSource.addToCart(addToCart);
  }
}
