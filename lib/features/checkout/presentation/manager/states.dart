import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';

abstract class OrderRegisterStates{}

class OrderRegisterInitialState extends OrderRegisterStates{}
class OrderRegisterLoadingState extends OrderRegisterStates{}
class AddressChangeState extends OrderRegisterStates{}
class OrderRegisterSuccessState extends OrderRegisterStates{
  final OrderRegistrationEntity order;

  OrderRegisterSuccessState({required this.order});
}
class OrderRegisterErrorState extends OrderRegisterStates{
  final String message;

  OrderRegisterErrorState({required this.message});
}