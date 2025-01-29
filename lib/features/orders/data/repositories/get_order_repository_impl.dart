import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/orders/data/data_sources/fire_base_orders_data_source.dart';
import 'package:e_commerce_app/features/orders/domain/repositories/get_order_repository.dart';

class GetOrderRepositoryImpl implements GetOrderRepository {
  final FireBaseOrdersDataSource fireBaseOrdersDataSource;

  GetOrderRepositoryImpl({required this.fireBaseOrdersDataSource});

  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getOnProcessingOrder() async {
    final result = await fireBaseOrdersDataSource.getOnProcessingOrder();

    return result.fold(
          (error) => Left(error),
          (response) {
        if (response.isEmpty) {
          return const Left('No orders found with status "OnProcessing".');
        }
        return Right(response);
      },
    );
  }
}