import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/use_cases/order_register_use_case.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderRegisterCubit extends Cubit<OrderRegisterStates>{
  final OrderRegisterUseCase orderRegisterUseCase;
  OrderRegisterCubit({required this.orderRegisterUseCase}):super(OrderRegisterInitialState());
  static OrderRegisterCubit get(context)=>BlocProvider.of(context);

  final TextEditingController addressController=TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  String? address;

void addressChange(String value){
  address=value;
  emit(AddressChangeState());

}

  Future<void> registerOrder(OrderRegistrationEntity order) async {
    emit(OrderRegisterLoadingState());
    final result =
    await orderRegisterUseCase.orderRegistrationRepository.registerOrder(order);
    result.fold((failure) => emit(OrderRegisterErrorState(message: failure.massage)),
            (response) => emit(OrderRegisterSuccessState(order: response)));
  }

}