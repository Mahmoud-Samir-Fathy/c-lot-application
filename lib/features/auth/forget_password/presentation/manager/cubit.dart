import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/use_cases/user_request_password_use_case.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReqPassCubit extends Cubit<UserReqPassStates> {
  final UserRequestPasswordUseCase userRequestPasswordUseCase;

  UserReqPassCubit({required this.userRequestPasswordUseCase})
      : super(UserReqPassInitialState());

  static UserReqPassCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController=TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  Future<void> requestPassword(UserForgetReq user, context) async {
    emit(UserReqPassLoadingState());

    final result = await userRequestPasswordUseCase.userForgetRepository
        .forgetRequest(user);

    if (!isClosed) {
      result.fold(
            (failure) => emit(UserReqPassErrorState("Error happened: $failure")),
            (response) {emit(UserReqPassSuccessState());
        },
      );
    }
  }

}
