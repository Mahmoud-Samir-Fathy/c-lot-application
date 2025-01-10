import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/home/domain/repositories/get_products_repository.dart';

class IsFavouriteUseCase extends UseCase<bool, String> {
  final GetProductsRepository getProductsRepository;

  IsFavouriteUseCase({required this.getProductsRepository});

  @override
  Future<bool>? call(String params) {
    return getProductsRepository.isFavourite(params);
  }
}
