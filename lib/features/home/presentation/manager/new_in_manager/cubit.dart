import 'package:e_commerce_app/features/home/domain/use_cases/get_new_in_products_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/new_in_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNewInProductCubit extends Cubit<GetNewInProductStates> {
  final GetNewInProductsUseCase getNewInProductsUseCase;

  GetNewInProductCubit({required this.getNewInProductsUseCase})
      : super(GetNewInProductInitialState());

  static GetNewInProductCubit get(context) => BlocProvider.of(context);

  void getNewInProducts() async {
    emit(GetNewInProductLoadingState());
    final data = await getNewInProductsUseCase.getProductsRepository.getNewInProducts();
    data.fold((error) => emit(GetNewInProductErrorState(message: error)),
        (response) => emit(GetNewInProductSuccessState(products: response)));
  }
}
