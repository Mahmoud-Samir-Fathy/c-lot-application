import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/use_cases/signin_use_case.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  final SignInUseCase signInUseCase;

  SignInCubit({required this.signInUseCase}) : super(SignInInitialState());
  static SignInCubit get(context)=>BlocProvider.of(context);

  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  Future<void> signIn(UserLogin user, context) async {
    emit(SignInLoadingState());
    final result = await signInUseCase.loginRepository.signIn(user);

    result.fold(
          (failure) {
        debugPrint('SignIn failed with message: $failure'); // Directly use failure here
        emit(SignInErrorState(failure)); // Pass failure (string) directly
      },
          (response) {
        debugPrint('SignIn succeeded');
        emit(SignInSuccessState());
      },
    );
  }

}
