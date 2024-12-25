import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';

abstract class ProductRepository{
  Future<Either> addToCart(AddToCartEntity addToCart);
}