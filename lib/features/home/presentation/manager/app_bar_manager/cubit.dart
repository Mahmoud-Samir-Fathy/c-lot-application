import 'package:e_commerce_app/features/home/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_user_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCubit extends Cubit<GetUserStates> {
  final GetUserUseCase getUserUseCase;

  GetUserCubit({required this.getUserUseCase}) : super(GetUserInitialState());

  static GetUserCubit get(context) => BlocProvider.of(context);

  void getUser() async {
    emit(GetUserLoadingState());
    final result = await getUserUseCase.getUserRepository.getUser();
    result.fold(
          (failure) => emit(GetUserErrorState(message: failure.toString())),
          (response) {
        emit(GetUserSuccessState(user: response));
      },
    );
  }
}
