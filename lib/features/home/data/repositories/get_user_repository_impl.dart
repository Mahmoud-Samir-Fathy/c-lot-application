import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/home/data/data_sources/fire_base_get_user_data_source.dart';
import 'package:e_commerce_app/features/home/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  final FireBaseGetUserDataSource fireBaseGetUserDataSource;

  GetUserRepositoryImpl({required this.fireBaseGetUserDataSource});

  @override
  Future<Either> getUser() async {
    var user = await fireBaseGetUserDataSource.getUser();
   return user.fold((error) =>Left(error),
           (response) =>Right(UserEntity.fromJson(response)));
  }
}