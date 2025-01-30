import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/orders/domain/repositories/get_order_repository.dart';

class GetReturnedOrderUseCase {
  final GetOrderRepository repository;

  GetReturnedOrderUseCase({required this.repository});

  Future<Either<String, List<OrderRegistrationEntity>>> call() async {
    return await repository.getReturnedOrder();
  }
}