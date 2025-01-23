import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/orders/domain/use_cases/get_on_processing_order_use_case.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrdersStates> {
  final GetOnProcessingOrderUseCase getOnProcessingOrdersUseCase;

  OrderCubit({required this.getOnProcessingOrdersUseCase})
      : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  void getOnProcessingOrder(OrderRegistrationEntity orders) async {
    emit(OrderLoadingState());

    final data = await getOnProcessingOrdersUseCase.getOrderRepository
        .getOnProcessingOrder(orders.orderStatus);
    data.fold((error) => emit(OrderErrorState(message: error)),
        (response) => emit(OrderSuccessState(orders: response)));
  }
}
