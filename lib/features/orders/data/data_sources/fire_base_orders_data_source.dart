import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseOrdersDataSource {
  Future<Either<String, List<OrderRegistrationEntity>>> getOnProcessingOrder();
}

class FireBaseOrdersDataSourceImpl implements FireBaseOrdersDataSource {
  @override
  Future<Either<String, List<OrderRegistrationEntity>>> getOnProcessingOrder() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return const Left('User not authenticated');

      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('orders')
          .where('orderStatus', isEqualTo: 'OnProcessing')
          .get();

      final orders = querySnapshot.docs
          .map((doc) => OrderRegistrationEntity.fromJson(doc.data()))
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(e.toString());
    }
  }
}