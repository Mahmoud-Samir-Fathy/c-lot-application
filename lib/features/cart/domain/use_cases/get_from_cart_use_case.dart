import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/domain/repositories/get_from_cart_repository.dart';

class GetFromCartUseCase extends UseCase<Either, GetFromCartEntity> {
  final GetFromCartRepository getFromCartRepository;

  GetFromCartUseCase({required this.getFromCartRepository});

  @override
  Future<Either>? call(GetFromCartEntity params) {
    return getFromCartRepository.getItemsFromCart();
  }
}
