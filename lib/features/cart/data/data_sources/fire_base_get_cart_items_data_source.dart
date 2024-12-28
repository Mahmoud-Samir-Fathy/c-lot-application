import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseCartItemsDataSource {
  Future<Either> getItemsFromCart();
  Future<Either> removeItemsFromCart(String id);
}

class FireBaseCartItemsDataSourceImpl
    implements FireBaseCartItemsDataSource {
  @override
  Future<Either> getItemsFromCart() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      var cartSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('cart')
          .get();
      List<Map>products=[];
      for(var item in cartSnapshot.docs){
        var data=item.data();
        data.addAll({'id': item.id});
        products.add(data);

      }
      return Right(products);
    } on FirebaseException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> removeItemsFromCart(String id) async{
    try {
      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('cart')
          .doc(id)
          .delete();

      return const Right('Successfully Removed');
    } on FirebaseException catch (e) {
      return Left(e.message ?? 'An unknown error occurred');
    }
  }
}
