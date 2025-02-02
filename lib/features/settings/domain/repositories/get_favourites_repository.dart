import 'package:dartz/dartz.dart';

abstract class SettingsRepository{
  Future<Either> getFavouriteProducts();
  Future<Either> signOut();
}