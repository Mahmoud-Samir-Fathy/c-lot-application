import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/splash/domain/repositories/authentication_repository.dart';

class AuthenticationUseCase extends UseCase<bool, dynamic> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationUseCase({required this.authenticationRepository});

  @override
  Future<bool>? call(dynamic params) {
    return authenticationRepository.authentication();
  }
}
