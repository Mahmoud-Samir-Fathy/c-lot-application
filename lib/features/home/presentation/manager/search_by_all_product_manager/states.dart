import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetAllProductsStates{}
class GetAllProductsInitialState extends GetAllProductsStates{}
class GetAllProductsLoadingState extends GetAllProductsStates{}
class GetAllProductsSuccessState extends GetAllProductsStates{
  final List<ProductEntity> products;

  GetAllProductsSuccessState({required this.products});
}
class GetAllProductsErrorState extends GetAllProductsStates{
  final String message;

  GetAllProductsErrorState({required this.message});
}
class SearchResultsUpdatedState extends GetAllProductsStates{}
class SearchClearedState extends GetAllProductsStates{}
