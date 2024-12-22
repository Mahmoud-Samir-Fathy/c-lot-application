import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';

abstract class GetCategoryStates {}

class GetCategoryInitialState extends GetCategoryStates {}

class GetCategoryLoadingState extends GetCategoryStates {}

class GetCategorySuccessState extends GetCategoryStates {
  final List<CategoriesEntity> category;

  GetCategorySuccessState({required this.category});
}

class GetCategoryErrorState extends GetCategoryStates {
  final String message;

  GetCategoryErrorState({required this.message});
}
