import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<int> {
  ColorCubit() : super(0);
  static ColorCubit get(context)=>BlocProvider.of(context);

  int selectedIndex = 0;

  void selectedColor(int index) {
    selectedIndex = index;
    emit(index);
  }
}
