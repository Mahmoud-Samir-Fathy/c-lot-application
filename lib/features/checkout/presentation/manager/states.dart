
abstract class OrderRegisterStates{}

class OrderRegisterInitialState extends OrderRegisterStates{}
class OrderRegisterLoadingState extends OrderRegisterStates{}
class AddressChangeState extends OrderRegisterStates{}
class OrderRegisterSuccessState extends OrderRegisterStates{}
class OrderRegisterErrorState extends OrderRegisterStates{
  final String message;

  OrderRegisterErrorState({required this.message});
}