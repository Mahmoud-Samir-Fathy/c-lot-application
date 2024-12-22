import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/repositories/user_forget_repository.dart';

class UserRequestPasswordUseCase extends UseCase<Either,UserForgetReq>{
  final UserForgetRepository userForgetRepository;

  UserRequestPasswordUseCase({required this.userForgetRepository});
  @override
  Future<Either>? call(UserForgetReq? params) {
  return  userForgetRepository.forgetRequest(params!);

  }
}