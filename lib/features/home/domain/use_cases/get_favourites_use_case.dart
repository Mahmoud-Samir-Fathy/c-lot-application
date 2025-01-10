import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';

class GetFavouritesUseCase extends UseCase<Either, dynamic> {
  final GetProductsRepository getProductsRepository;

  GetFavouritesUseCase({required this.getProductsRepository});

  @override
  Future<Either>? call(params) {
    return getProductsRepository.getFavouriteProducts();
  }
}
