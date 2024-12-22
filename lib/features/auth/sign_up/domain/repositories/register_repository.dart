import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';

abstract class RegisterRepository{
  Future<Either> signUP(UserRegister user);
}