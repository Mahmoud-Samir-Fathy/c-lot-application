import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';

abstract class OrdersStates{}
class OrderInitialState extends OrdersStates{}
class  GetOnProcessingOrderLoadingState extends OrdersStates{}
class GetOnProcessingOrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  GetOnProcessingOrderSuccessState({required this.orders});
}
class GetOnProcessingOrderErrorState extends OrdersStates{
  final String  message;

  GetOnProcessingOrderErrorState({required this.message});
}


class  GetReturnedOrderLoadingState extends OrdersStates{}
class GetReturnedOrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  GetReturnedOrderSuccessState({required this.orders});
}
class GetReturnedOrderErrorState extends OrdersStates{
  final String  message;

  GetReturnedOrderErrorState({required this.message});
}





class  GetCancelledOrderLoadingState extends OrdersStates{}
class GetCancelledOrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  GetCancelledOrderSuccessState({required this.orders});
}
class GetCancelledOrderErrorState extends OrdersStates{
  final String  message;

  GetCancelledOrderErrorState({required this.message});
}



class  GetDeliveredOrderLoadingState extends OrdersStates{}
class GetDeliveredOrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  GetDeliveredOrderSuccessState({required this.orders});
}
class GetDeliveredOrderErrorState extends OrdersStates{
  final String  message;

  GetDeliveredOrderErrorState({required this.message});
}




class  GetShippedOrderLoadingState extends OrdersStates{}
class GetShippedOrderSuccessState extends OrdersStates{
  final List<OrderRegistrationEntity> orders;

  GetShippedOrderSuccessState({required this.orders});
}
class GetShippedOrderErrorState extends OrdersStates{
  final String  message;

  GetShippedOrderErrorState({required this.message});
}