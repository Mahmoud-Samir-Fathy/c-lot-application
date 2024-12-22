import 'package:e_commerce_app/features/home/domain/use_cases/get_products_by_category_id_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/products_by_category_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryStates> {
  final GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;

  GetProductsByCategoryCubit({required this.getProductsByCategoryIdUseCase})
      : super(GetProductsByCategoryInitialState());

  static GetProductsByCategoryCubit get(context) => BlocProvider.of(context);

  void getProducts(String categoryId) async {
    emit(GetProductsByCategoryLoadingState());
    final data = await getProductsByCategoryIdUseCase.getProductsRepository.getProductsByCategoryId(categoryId);
    data.fold((error) => emit(GetProductsByErrorSuccessState(message: error)),
            (response) => emit(GetProductsByCategorySuccessState(products: response)));
  }
}
