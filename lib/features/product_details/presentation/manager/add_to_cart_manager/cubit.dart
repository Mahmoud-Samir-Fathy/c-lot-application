import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/helper/dialog_helper.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/add_to_cart_manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartStates> {
  final AddToCartUseCase addToCartUseCase;

  AddToCartCubit({required this.addToCartUseCase})
      : super(AddToCartInitialState());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  Future<void> addToCart(AddToCartEntity addToCart, context) async {
    emit(AddToCartLoadingState());
    final result =
        await addToCartUseCase.productRepository.addToCart(addToCart);
    result
        .fold((failure) => emit(AddToCartErrorState(message: failure.massage)),
            (response) {
      emit(AddToCartSuccessState(cart: response));
      DialogHelper.showCustomDialog(
          context: context,
          title: 'Successfully Add to cart items',
          message: 'Do want to go to cart page',
          positiveButtonText: "Yes",
          negativeButtonText: "No",
          onPositivePressed: () {
            AppNavigators.push(context, AppRoutes.cart);
          },
          onNegativePressed: () {
            Navigator.pop(context);
          });
    });
  }
}
