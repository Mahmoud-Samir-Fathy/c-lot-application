import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseGetCartItemsDataSource {
  Future<Either> getItemsFromCart();
}

class FireBaseGetCartItemsDataSourceImpl
    implements FireBaseGetCartItemsDataSource {
  @override
  Future<Either> getItemsFromCart() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      var cartSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('cart')
          .get();
      final cartItems = cartSnapshot.docs
          .map((doc) => GetFromCartEntity.fromJson(doc.data()))
          .toList();
      return Right(cartItems);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }
}