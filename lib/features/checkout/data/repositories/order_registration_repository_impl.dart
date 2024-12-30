import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/repositories/order_registration_repository.dart';

import '../data_sources/fire_base_order_registration_data_source.dart';

class OrderRegistrationRepositoryImpl implements OrderRegistrationRepository{
  final FireBaseOrderRegistrationDataSource fireBaseOrderRegistrationDataSource;

  OrderRegistrationRepositoryImpl({required this.fireBaseOrderRegistrationDataSource});
  @override
  Future<Either> registerOrder(OrderRegistrationEntity order) {
    return fireBaseOrderRegistrationDataSource.registerOrder(order);
  }
}