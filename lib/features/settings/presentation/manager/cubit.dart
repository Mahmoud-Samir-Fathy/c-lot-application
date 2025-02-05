import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/add_address_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/get_address_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/get_favourites_use_case.dart';
import 'package:e_commerce_app/features/settings/domain/use_cases/sign_out_use_case.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  final GetFavouritesUseCase getFavouriteUseCase;
  final SignOutUseCase signOutUseCase;
  final AddAddressUseCase addAddressUseCase;
  final GetAddressUseCase getAddressUseCase;

  SettingsCubit(
      {required this.getAddressUseCase,
        required this.signOutUseCase,
      required this.getFavouriteUseCase,
      required this.addAddressUseCase})
      : super(GetFavouriteInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  void getFavouriteProduct() async {
    emit(GetFavouriteLoadingState());
    final data =
        await getFavouriteUseCase.settingsRepository.getFavouriteProducts();
    data.fold((error) => emit(GetFavouriteErrorState(message: error)),
        (response) => emit(GetFavouriteSuccessState(favourites: response)));
  }

  void signOut() async {
    final data = await signOutUseCase.settingsRepository.signOut();
    data.fold((error) => emit(SignOutErrorState(message: error)),
        (response) => emit(SignOutSuccessState()));
  }

  final TextEditingController cityController=TextEditingController();
  final TextEditingController zipCodeController=TextEditingController();
  final TextEditingController stateController=TextEditingController();
  final TextEditingController stController=TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  void addAddress(AddressEntity address) async {
    emit(AddAddressLoadingState());
    final data = await addAddressUseCase.settingsRepository.addAddress(address);
    if (isClosed) return;
    data.fold(
          (error) => emit(AddAddressErrorState(message: error)),
          (response) => emit(AddAddressSuccessState()),
    );
  }
  void getAddress()async{
    emit(GetAddressLoadingState());
    final data =
        await getAddressUseCase.settingsRepository.getAddresses();
    data.fold((error) => emit(GetAddressErrorState(message: error)),
            (response) => emit(GetAddressSuccessState(address: response)));


  }

}
