import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_in/data/data_sources/firebase_signin_data_source.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{
  final FirebaseSignInDataSource firebaseSignInDataSource;

  LoginRepositoryImpl({required this.firebaseSignInDataSource});
  @override
  Future<Either> signIn(UserLogin user) {

    return firebaseSignInDataSource.signIn(user);
  }
}