import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';

abstract class OrdersStates{}
class OrderInitialState extends OrdersStates{}
class OrderLoadingState extends OrdersStates{}
class OrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  OrderSuccessState({required this.orders});
}
class OrderErrorState extends OrdersStates{
  final String  message;

  OrderErrorState({required this.message});
}