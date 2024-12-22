import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/repositories/login_repository.dart';

class SignInUseCase extends UseCase<Either,UserLogin>{
  final LoginRepository loginRepository;

  SignInUseCase({required this.loginRepository});
  @override
  Future<Either>? call(UserLogin? params) {
    return loginRepository.signIn(params!);
  }
}