import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/quantity_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<QuantityStates>{
  QuantityCubit():super(QuantityInitialState());
  static QuantityCubit get(context)=>BlocProvider.of(context);

  int index=1;
  void increaseQuantity(){
    index++;
    emit(QuantityIncreaseState(quantity: index));
  }
  void decreaseQuantity(){
    if(index>1){
      --index;
    }
    emit(QuantityDecreaseState(quantity: index));
  }
}