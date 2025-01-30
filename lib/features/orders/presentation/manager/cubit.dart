import 'package:e_commerce_app/features/orders/domain/use_cases/get_cancelled_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_delivered_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_on_processing_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_returned_order_use_case.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_shipped_order_use_case.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrdersStates> {
  final GetOnProcessingOrdersUseCase getOnProcessingOrdersUseCase;
  final GetCancelledOrderUseCase getCancelledOrderUseCase;
  final GetReturnedOrderUseCase getReturnedOrderUseCase;
  final GetDeliveredOrderUseCase getDeliveredOrderUseCase;
  final GetShippedOrderUseCase getShippedOrderUseCase;

  OrderCubit({required this.getCancelledOrderUseCase,required this.getReturnedOrderUseCase,required this.getDeliveredOrderUseCase,required this.getShippedOrderUseCase, required this.getOnProcessingOrdersUseCase})
      : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  void getOnProcessingOrder() async {
    emit(GetOnProcessingOrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(GetOnProcessingOrderErrorState(message: error)),
          (orders) => emit(GetOnProcessingOrderSuccessState(orders: orders)),
    );
  }
  void getCancelledOrder() async {
    emit(GetCancelledOrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(GetCancelledOrderErrorState(message: error)),
          (orders) => emit(GetCancelledOrderSuccessState(orders: orders)),
    );
  }
  void getReturnedOrder() async {
    emit(GetReturnedOrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(GetReturnedOrderErrorState(message: error)),
          (orders) => emit(GetReturnedOrderSuccessState(orders: orders)),
    );
  }
  void getDeliveredOrder() async {
    emit(GetDeliveredOrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(GetDeliveredOrderErrorState(message: error)),
          (orders) => emit(GetDeliveredOrderSuccessState(orders: orders)),
    );
  }
  void getShippedOrder() async {
    emit(GetShippedOrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(GetShippedOrderErrorState(message: error)),
          (orders) => emit(GetShippedOrderSuccessState(orders: orders)),
    );
  }
}