import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/settings_repository.dart';

class DeleteAddressUseCase extends UseCase<Either,String>{
  final SettingsRepository settingsRepository;

  DeleteAddressUseCase({required this.settingsRepository});

  @override
  Future<Either>? call(String params) {
    return settingsRepository.deleteAddress(params);

  }

}