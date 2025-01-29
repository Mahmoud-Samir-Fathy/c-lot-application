import 'package:e_commerce_app/features/orders/domain/use_cases/get_on_processing_order_use_case.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrdersStates> {
  final GetOnProcessingOrdersUseCase getOnProcessingOrdersUseCase;

  OrderCubit({required this.getOnProcessingOrdersUseCase})
      : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  void getOnProcessingOrder() async {
    emit(OrderLoadingState());

    final result = await getOnProcessingOrdersUseCase();
    result.fold(
          (error) => emit(OrderErrorState(message: error)),
          (orders) => emit(OrderSuccessState(orders: orders)),
    );
  }
}