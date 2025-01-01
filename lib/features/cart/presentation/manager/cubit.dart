import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/get_from_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/domain/use_cases/remove_from_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  final GetFromCartUseCase getFromCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;

  CartCubit({required this.getFromCartUseCase,required this.removeFromCartUseCase}) : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  void getItemsFromCart() async {
    emit(CartLoadingState());
    final result = await getFromCartUseCase.cartRepository.getItemsFromCart();
    result.fold(
          (failure) => emit(GetFromCartErrorState(message: failure.toString())),
          (response) {
            emit(GetFromCartSuccessState(cart: response));

      },
    );
  }

  void removeItemsFromCart(CartEntity cart) async{
    emit(CartLoadingState());
    final result = await removeFromCartUseCase.cartRepository.removeItemsFromCart(
      cart.id
    );
    result.fold((failure) => emit(RemovedErrorState(message: failure.toString())),
          (response) {emit(RemovedSuccessfullyState());
            getItemsFromCart();
          },
    );
  }
}
