import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/forget_password/data/data_sources/firebase_forget_password_data_source.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/repositories/user_forget_repository.dart';

class UserForgetRepositoryImpl implements UserForgetRepository{
  final FirebaseForgetPasswordDataSource firebaseForgetPasswordDataSource;

  UserForgetRepositoryImpl({required this.firebaseForgetPasswordDataSource});
  @override
  Future<Either> forgetRequest(UserForgetReq user)  {
    return firebaseForgetPasswordDataSource.forgetRequest(user);
  }
}