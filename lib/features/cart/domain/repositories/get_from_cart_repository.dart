import 'package:dartz/dartz.dart';

abstract class CartRepository{
  Future<Either> getItemsFromCart();
  Future<Either> removeItemsFromCart(String id);
}