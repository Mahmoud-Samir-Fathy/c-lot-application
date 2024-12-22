import 'package:dartz/dartz.dart';

abstract class GetCategoriesRepository{
  Future<Either> getCategories();
}