import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/cart/domain/repositories/get_from_cart_repository.dart';

class RemoveFromCartUseCase extends UseCase<Either,String>{
  final CartRepository cartRepository;

  RemoveFromCartUseCase({required this.cartRepository});

  @override
  Future<Either>? call(String params) {
    return cartRepository.removeItemsFromCart(params);
  
  }

}