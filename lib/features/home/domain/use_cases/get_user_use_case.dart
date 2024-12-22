import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_user_repository.dart';

class GetUserUseCase extends UseCase<Either, UserEntity> {
  final GetUserRepository getUserRepository;

  GetUserUseCase({required this.getUserRepository});

  @override
  Future<Either>? call(UserEntity params) {
    return getUserRepository.getUser();
  }
}
