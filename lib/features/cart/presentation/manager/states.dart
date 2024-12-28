import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class GetFromCartSuccessState extends CartStates {
  final List<CartEntity> cart;

  GetFromCartSuccessState({required this.cart});
}

class GetFromCartErrorState extends CartStates {
  final String message;

  GetFromCartErrorState({required this.message});
}

class RemovedSuccessfullyState extends CartStates{}

class RemovedErrorState extends CartStates{
  final String message;

  RemovedErrorState({required this.message});
}