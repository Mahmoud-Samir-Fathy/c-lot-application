import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';

abstract class GetFromCartStates {}

class GetFromCartInitialState extends GetFromCartStates {}

class GetFromCartLoadingState extends GetFromCartStates {}

class GetFromCartSuccessState extends GetFromCartStates {
  final List<GetFromCartEntity> cart;

  GetFromCartSuccessState({required this.cart});
}

class GetFromCartErrorState extends GetFromCartStates {
  final String message;

  GetFromCartErrorState({required this.message});
}
