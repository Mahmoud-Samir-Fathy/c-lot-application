import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/get_favourites_repository.dart';

class GetFavouritesUseCase extends UseCase<Either, dynamic> {
  final GetFavouritesRepository getFavouritesRepository;

  GetFavouritesUseCase({required this.getFavouritesRepository});

  @override
  Future<Either>? call(params) {
    return getFavouritesRepository.getFavouriteProducts();
  }
}
