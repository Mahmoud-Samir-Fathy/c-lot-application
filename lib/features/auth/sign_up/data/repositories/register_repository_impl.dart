import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_up/data/data_sources/firebase_signup_data_source.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{
  final FirebaseSignupDataSource firebaseSignupDataSource;
  RegisterRepositoryImpl({required this.firebaseSignupDataSource});

  @override
  Future<Either> signUP(UserRegister user) {
    return firebaseSignupDataSource.signUP(user);
  }
}