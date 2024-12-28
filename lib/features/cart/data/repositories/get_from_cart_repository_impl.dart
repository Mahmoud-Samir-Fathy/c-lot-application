import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/data/data_sources/fire_base_get_cart_items_data_source.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/domain/repositories/get_from_cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final FireBaseCartItemsDataSource fireBaseCartItemsDataSource;

  CartRepositoryImpl({required this.fireBaseCartItemsDataSource});

  @override
  Future<Either> getItemsFromCart() async {
    var user = await fireBaseCartItemsDataSource.getItemsFromCart();

    return user.fold(
      (error) => Left(error),
      (response) {
        if (response == null || (response as List).isEmpty) {
          return Left(Exception('No items found.'));
        }

        try {
          final cartItems = (response)
              .map((cart) => CartEntity.fromJson(cart))
              .toList();
          return Right(cartItems);
        } catch (e) {
          return Left(Exception('Failed to parse cart items: $e'));
        }
      },
    );
  }

  @override
  Future<Either> removeItemsFromCart(String id) async {
    var user = await fireBaseCartItemsDataSource.removeItemsFromCart(id);

    return user.fold((error) => Left(error), (response) => Right(response));
  }
}
