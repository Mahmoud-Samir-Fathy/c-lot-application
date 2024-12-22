import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';

class GetProductsByCategoryIdUseCase extends UseCase<Either,String>{
  final GetProductsRepository getProductsRepository;

  GetProductsByCategoryIdUseCase({required this.getProductsRepository});
  @override
  Future<Either>? call(String params) {
    return getProductsRepository.getProductsByCategoryId(params);
  }

}