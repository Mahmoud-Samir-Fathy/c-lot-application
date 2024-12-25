import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/use_cases/signup_usecase.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignupUseCase signupUseCase;
  SignUpCubit({required this.signupUseCase}) : super(SignUpInitialState());
  static SignUpCubit get(context)=>BlocProvider.of(context);


  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  bool isMan = true;
  String selectedAgeRange = "Age Range";

  void selectGender(bool man) {
    isMan = man;
    emit(SignUpGenderChangedState());
  }

  void selectAgeRange(String ageRange) {
    selectedAgeRange = ageRange;
    emit(SignUpAgeRangeChangedState());
  }

  Future<void> signUp(UserRegister user , context) async {
    emit(SignUpLoading());

    final result = await signupUseCase.registerRepository.signUP(user);

    result.fold((failure) {emit(SignUpErrorState(failure.massage));},
          (_) {
      // Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
      emit(SignUpSuccessState());
    },
    );
  }
}
