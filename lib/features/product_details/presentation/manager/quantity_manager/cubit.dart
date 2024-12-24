import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<int>{
  QuantityCubit():super(1);
  static QuantityCubit get(context)=>BlocProvider.of(context);

  void increaseQuantity(){
    emit(state+1);
  }
  void decreaseQuantity(){
    if(state>1){
      emit(state-1);
    }
  }
  int calculateTotalPrice({
    required int quantity,
    required int price,
  }) {
    final effectivePrice =
   price*quantity;
    return effectivePrice;
  }
}