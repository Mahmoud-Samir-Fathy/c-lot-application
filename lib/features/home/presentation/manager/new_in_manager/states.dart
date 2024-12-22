import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class GetNewInProductStates{}
class  GetNewInProductInitialState extends GetNewInProductStates{}
class  GetNewInProductLoadingState extends GetNewInProductStates{}
class  GetNewInProductSuccessState extends GetNewInProductStates{
  final List<ProductEntity> products;

  GetNewInProductSuccessState({required this.products});
}
class  GetNewInProductErrorState extends GetNewInProductStates{
  final String message;

  GetNewInProductErrorState({required this.message});
}