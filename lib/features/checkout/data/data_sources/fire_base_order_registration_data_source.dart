import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseOrderRegistrationDataSource {
  Future<Either> registerOrder(OrderRegistrationEntity order);
}

class FireBaseOrderRegistrationDataSourceImpl
    implements FireBaseOrderRegistrationDataSource {
  @override
  Future<Either> registerOrder(OrderRegistrationEntity order) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('orders')
          .add(order.toJson());
      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('cart')
            .doc(item.id)
            .delete();
      }
      return const Right('Order Successfully Added');
    } on FirebaseException catch (e) {
      return Left(e.message.toString());
    }
  }
}
