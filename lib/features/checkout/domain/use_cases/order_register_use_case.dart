import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/repositories/order_registration_repository.dart';

class OrderRegisterUseCase extends UseCase<Either,OrderRegistrationEntity>{
  final OrderRegistrationRepository orderRegistrationRepository;

  OrderRegisterUseCase({required this.orderRegistrationRepository});
  @override
  Future<Either>? call(OrderRegistrationEntity params) {
  return orderRegistrationRepository.registerOrder(params);
  }

}