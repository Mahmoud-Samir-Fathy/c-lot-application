import 'package:dartz/dartz.dart';

abstract class GetFavouritesRepository{
  Future<Either> getFavouriteProducts();
}