import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetProductStates{}
class GetProductInitialState extends GetProductStates{}
class GetProductLoadingState extends GetProductStates{}
class GetProductSuccessState extends GetProductStates{
  final List<ProductEntity> products;

  GetProductSuccessState({required this.products});
}
class GetProductErrorState extends GetProductStates{
  final String message;

  GetProductErrorState({required this.message});
}