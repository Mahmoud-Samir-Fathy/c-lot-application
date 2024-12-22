import 'package:e_commerce_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCategoryCubit extends Cubit<GetCategoryStates> {
  final GetCategoriesUseCase getCategoriesUseCase;

  GetCategoryCubit({required this.getCategoriesUseCase}) : super(GetCategoryInitialState());

  static GetCategoryCubit get(context) => BlocProvider.of(context);

  void getCategory() async {
    emit(GetCategoryLoadingState());
    final result = await getCategoriesUseCase.getCategoriesRepository.getCategories();
    result.fold(
          (failure) => emit(GetCategoryErrorState(message: failure.toString())),
          (response) {
        emit(GetCategorySuccessState(category: response));
      },
    );
  }
}
