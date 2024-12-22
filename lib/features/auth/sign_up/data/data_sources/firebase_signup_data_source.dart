import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseSignupDataSource {
  Future<Either> signUP(UserRegister user);
}

class FirebaseSignUpDataSourceImpl implements FirebaseSignupDataSource {
  @override
  Future<Either> signUP(UserRegister user) async {
    try {
      final dataReceived = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      FirebaseFirestore.instance
          .collection('users')
          .doc(dataReceived.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender':user.gender,
        'age':user.age,
      });
      return const Right('Sign Up Successfully');
    } on FirebaseException catch (e) {
      String message='';
      if(e.code=='weak password'){
        message='The password provided is to weak';
      }
      else if(e.code=='email already in use'){
        message='Email already used';

      }
      return  Left(message);
    }
  }
}
