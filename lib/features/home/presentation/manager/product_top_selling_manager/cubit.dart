import 'package:e_commerce_app/features/home/domain/use_cases/get_Top_Selling_products_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  final GetTopSellingProductsUseCase getTopSellingProductsUseCase;

  GetProductCubit({required this.getTopSellingProductsUseCase})
      : super(GetProductInitialState());

  static GetProductCubit get(context) => BlocProvider.of(context);

  void getTopSellingProducts() async {
    emit(GetProductLoadingState());
    final data = await getTopSellingProductsUseCase.getProductsRepository.getTopSellingProducts();
    data.fold((error) => emit(GetProductErrorState(message: error)),
        (response) => emit(GetProductSuccessState(products: response)));
  }
}
