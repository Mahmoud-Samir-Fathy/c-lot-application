import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';

abstract class UserForgetRepository{
  Future<Either> forgetRequest(UserForgetReq user);
}