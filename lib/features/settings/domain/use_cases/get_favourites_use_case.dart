import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/settings_repository.dart';

class GetFavouritesUseCase extends UseCase<Either, dynamic> {
  final SettingsRepository settingsRepository;

  GetFavouritesUseCase({required this.settingsRepository});

  @override
  Future<Either>? call(params) {
    return settingsRepository.getFavouriteProducts();
  }
}
