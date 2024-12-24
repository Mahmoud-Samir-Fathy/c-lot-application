import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<int> {
  SizeCubit() : super(0);

  static SizeCubit get(context) => BlocProvider.of(context);

  int selectedIndex=0;

  void selectSize(int index) {
    selectedIndex = index;
    emit(index);
  }
}
