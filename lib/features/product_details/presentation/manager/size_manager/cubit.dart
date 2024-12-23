import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/size_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<SizeStates> {
  SizeCubit() : super(SizeInitialState());

  static SizeCubit get(context) => BlocProvider.of(context);

  int selectedIndex=0;

  void selectSize(int index) {
    selectedIndex = index;
    emit(ChangeSizeState());
  }
}
