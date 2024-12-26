import 'package:e_commerce_app/features/cart/domain/use_cases/get_from_cart_use_case.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFromCartCubit extends Cubit<GetFromCartStates> {
  final GetFromCartUseCase getFromCartUseCase;

  GetFromCartCubit({required this.getFromCartUseCase}) : super(GetFromCartInitialState());

  static GetFromCartCubit get(context) => BlocProvider.of(context);

  void getItemsFromCart() async {
    emit(GetFromCartLoadingState());
    final result = await getFromCartUseCase.getFromCartRepository.getItemsFromCart();
    result.fold(
          (failure) => emit(GetFromCartErrorState(message: failure.toString())),
          (response) {
        emit(GetFromCartSuccessState(cart: response));
      },
    );
  }
}
