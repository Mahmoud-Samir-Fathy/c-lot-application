import 'package:dartz/dartz.dart';

abstract class GetUserRepository{
  Future<Either> getUser();
}