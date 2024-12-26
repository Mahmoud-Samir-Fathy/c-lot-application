import 'package:dartz/dartz.dart';

abstract class GetFromCartRepository{
  Future<Either> getItemsFromCart();
}