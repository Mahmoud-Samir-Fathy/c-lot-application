import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseProductDataSource {
  Future<Either> addToCart(AddToCartEntity addToCart);

}
class FireBaseProductDataSourceImpl implements FireBaseProductDataSource{
  @override
  Future<Either> addToCart(AddToCartEntity addToCart) async {
    try{
      final user=FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).collection('cart').add(addToCart.toJson());
      return  Right(addToCart);
    }on FirebaseException catch(e){
      return  Left(e.toString());
    }
  }
}