import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/usecase.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/settings/domain/repositories/settings_repository.dart';

class AddAddressUseCase extends UseCase<Either,AddressEntity>{
  final SettingsRepository settingsRepository;

  AddAddressUseCase({required this.settingsRepository});

  @override
  Future<Either>? call(AddressEntity params) {
   return settingsRepository.getAddresses();
  }

}