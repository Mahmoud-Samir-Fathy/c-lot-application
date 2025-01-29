import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';

abstract class GetOrderRepository {
  Future<Either<String, List<OrderRegistrationEntity>>> getOnProcessingOrder();
}