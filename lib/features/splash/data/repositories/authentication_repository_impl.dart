import 'package:e_commerce_app/features/splash/data/data_sources/firebase_authentication_data_source.dart';
import 'package:e_commerce_app/features/splash/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  final FireBaseAuthenticationDataSource fireBaseAuthenticationDataSource;

  AuthenticationRepositoryImpl({required this.fireBaseAuthenticationDataSource});
  @override
  Future<bool> authentication() {

    return fireBaseAuthenticationDataSource.authentication();
  }
}