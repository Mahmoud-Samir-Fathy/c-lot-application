import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/orders/data/data_sources/fire_base_orders_data_source.dart';
import 'package:e_commerce_app/features/orders/domain/repositories/get_order_repository.dart';

class GetOrderRepositoryImpl implements GetOrderRepository{
  final FireBaseOrdersDataSource fireBaseOrdersDataSource;

  GetOrderRepositoryImpl({required this.fireBaseOrdersDataSource});
  @override
  Future<Either> getOnProcessingOrder() async{
    var data = await fireBaseOrdersDataSource.getOnProcessingOrder();
    return data.fold((error) => Left(error), (response) {
      if (response == null || (response as List).isEmpty) {
        return Left(Exception('No Products found.'));
      }
      try {
        final products = (response).map((product) => OrderRegistrationEntity.fromJson(product)).toList();
        return Right(products);
      } catch (e) {
        return Left(Exception('Failed to parse products: $e'));
      }
    });
  }
}