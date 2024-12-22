import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';

abstract class LoginRepository{
  Future<Either> signIn(UserLogin user);
}