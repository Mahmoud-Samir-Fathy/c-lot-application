import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/add_to_cart_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<AddToCartStates> {
  final AddToCartUseCase addToCartUseCase;

  AddToCartCubit({required this.addToCartUseCase})
      : super(AddToCartInitialState());

  static AddToCartCubit get(context) => BlocProvider.of(context);

  Future<void> addToCart(AddToCartEntity addToCart) async {
    emit(AddToCartLoadingState());
    final result =
        await addToCartUseCase.productRepository.addToCart(addToCart);
    result.fold((failure) => emit(AddToCartErrorState(message: failure.massage)),
        (response) => emit(AddToCartSuccessState(cart: response)));
  }
}
