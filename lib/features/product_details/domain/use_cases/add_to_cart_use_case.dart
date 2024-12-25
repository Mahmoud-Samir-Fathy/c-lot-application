import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/features/product_details/domain/repositories/product_repository.dart';

class AddToCartUseCase extends UseCase<Either,AddToCartEntity>{
  final ProductRepository productRepository;

  AddToCartUseCase({required this.productRepository});
  @override
  Future<Either>? call(AddToCartEntity? params) {
    return productRepository.addToCart(params!);

  }
}