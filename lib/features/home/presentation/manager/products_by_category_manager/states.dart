import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetProductsByCategoryStates{}
class GetProductsByCategoryInitialState extends GetProductsByCategoryStates{}
class GetProductsByCategoryLoadingState extends GetProductsByCategoryStates{}
class GetProductsByCategorySuccessState extends GetProductsByCategoryStates{
  final List<ProductEntity> products;

  GetProductsByCategorySuccessState({required this.products});
}
class GetProductsByErrorSuccessState extends GetProductsByCategoryStates{
  final String message;

  GetProductsByErrorSuccessState({required this.message});
}