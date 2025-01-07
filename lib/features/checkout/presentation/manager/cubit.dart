import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/use_cases/order_register_use_case.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes.dart';
import '../../../../core/utilis/helpers/app_navigators.dart';

class OrderRegisterCubit extends Cubit<OrderRegisterStates> {
  final OrderRegisterUseCase orderRegisterUseCase;

  OrderRegisterCubit({required this.orderRegisterUseCase}) : super(OrderRegisterInitialState());

  static OrderRegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController addressController = TextEditingController();
  void updateAddress(String newAddress) {
    addressController.text = newAddress;
    emit(AddressChangeState(address: addressController.text));
  }


  Future<void> registerOrder(OrderRegistrationEntity order, BuildContext context) async {
    emit(OrderRegisterLoadingState());
    try {
      final result =
      await orderRegisterUseCase.orderRegistrationRepository.registerOrder(order);

      result.fold(
            (failure) {
          emit(OrderRegisterErrorState(message: failure.toString()));
          print("Error: ${failure.toString()}");
        },
            (response) {
          emit(OrderRegisterSuccessState());
          AppNavigators.pushAndReplacement(context, AppRoutes.orderSuccessful);
        },
      );
    } catch (e) {
      emit(OrderRegisterErrorState(message: e.toString()));
      print("Error: ${e.toString()}");
    }
  }
}
