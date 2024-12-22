import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/search_by_all_product_manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsStates> {
  final GetAllProductsUseCase getAllProductsUseCase;

  GetAllProductsCubit({required this.getAllProductsUseCase})
      : super(GetAllProductsInitialState());

  static GetAllProductsCubit get(context) => BlocProvider.of(context);

  void getAllProducts(String title) async {
    emit(GetAllProductsLoadingState());
    final data =
        await getAllProductsUseCase.getProductsRepository.getAllProducts(title);
    data.fold(
      (error) {
        emit(GetAllProductsErrorState(message: error));
      },
      (response) {
        productInfo = response;
        emit(GetAllProductsSuccessState(products: response));
      },
    );
  }

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  List<ProductEntity>? productInfo;

  List<ProductEntity> searchResults = [];

  ProductEntity? productEntity;

  void searchProduct(String query) {
    if (productInfo == null || productInfo!.isEmpty) return;

    searchResults = productInfo!.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(SearchResultsUpdatedState());
  }

  void clearSearch() {
    searchController.clear();
    searchResults = [];
    searchFocusNode.unfocus();
    emit(SearchResultsUpdatedState());
  }

  void requestFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });
  }
}
