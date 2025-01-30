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

  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getShippedOrder() async{
    final result = await fireBaseOrdersDataSource.getShippedOrder();

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

  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getCancelledOrder() async{
    final result = await fireBaseOrdersDataSource.getCancelledOrder();

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

  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getDeliveredOrder() async{
    final result = await fireBaseOrdersDataSource.getDeliveredOrder();

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

  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getReturnedOrder() async{
    final result = await fireBaseOrdersDataSource.getReturnedOrder();

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