import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/repositories/register_repository.dart';

class SignupUseCase extends UseCase<Either, UserRegister> {
  final RegisterRepository registerRepository;
  SignupUseCase({required this.registerRepository});
  @override
  Future<Either>? call(UserRegister? params) {
    return registerRepository.signUP(params!);
  }
}
