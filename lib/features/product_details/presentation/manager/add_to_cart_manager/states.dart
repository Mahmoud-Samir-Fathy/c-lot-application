import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';

abstract class AddToCartStates{}
class AddToCartInitialState extends AddToCartStates{}
class AddToCartLoadingState extends AddToCartStates{}
class AddToCartSuccessState extends AddToCartStates{
  final AddToCartEntity cart;

  AddToCartSuccessState({required this.cart});
}
class AddToCartErrorState extends AddToCartStates{
  final String message;

  AddToCartErrorState({required this.message});
}