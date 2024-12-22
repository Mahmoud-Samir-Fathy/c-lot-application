import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';

class GetNewInProductsUseCase extends UseCase<Either,ProductEntity>{
  final GetProductsRepository getProductsRepository;

  GetNewInProductsUseCase({required this.getProductsRepository});
  @override
  Future<Either>? call(ProductEntity params) {
    return getProductsRepository.getNewInProducts();
  }
}