import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/orders/domain/repositories/get_order_repository.dart';

class GetOnProcessingOrderUseCase
    extends UseCase<Either, dynamic> {
  final GetOrderRepository getOrderRepository;

  GetOnProcessingOrderUseCase({required this.getOrderRepository});

  @override
  Future<Either>? call(params) {
    return getOrderRepository.getOnProcessingOrder();
  }

}
