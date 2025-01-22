import 'package:e_commerce_app/features/settings/domain/use_cases/get_favourites_use_case.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteStates> {
  final GetFavouritesUseCase getFavouriteUseCase;

  GetFavouriteCubit({required this.getFavouriteUseCase})
      : super(GetFavouriteInitialState());

  static GetFavouriteCubit get(context) => BlocProvider.of(context);

  void getFavouriteProduct() async {
    emit(GetFavouriteLoadingState());
    final data = await getFavouriteUseCase.getFavouritesRepository.getFavouriteProducts();
    data.fold((error) => emit(GetFavouriteErrorState(message: error)),
        (response) => emit(GetFavouriteSuccessState(favourites: response)));
  }
}
