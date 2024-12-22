import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseGetUserDataSource {
  Future<Either> getUser();
}

class FireBaseGetUserDataSourceImpl implements FireBaseGetUserDataSource {
  @override
  Future<Either> getUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      var userData=await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get().then((value)=>value.data());
        return Right(userData);
        
    } on FirebaseException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception("An unexpected error occurred: $e"));
    }
  }
}

