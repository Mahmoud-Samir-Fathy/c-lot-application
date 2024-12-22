import 'package:e_commerce_app/features/home/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class  GetUserStates{}

class GetUserInitialState extends GetUserStates{}
class GetUserLoadingState extends GetUserStates{}
class GetUserSuccessState extends GetUserStates{
  final UserEntity user;

  GetUserSuccessState({required this.user});
}
class GetUserErrorState extends GetUserStates{
  final String message;
  GetUserErrorState({required this.message});
}