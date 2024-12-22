import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/use_cases/signin_use_case.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/states.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/pages/enter_password.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../dependency_injection.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(signInUseCase: sl<SignInUseCase>()),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SignInCubit.get(context);
          return Scaffold(
            appBar: const BasicAppbar(
              hideBack: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 80.h),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomTextFormFieldWidget(
                        hint: 'Email Address',
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomMaterialButton(
                        text: "Continue",
                        onPressed: () {
                          if (cubit.formKey.currentState?.validate() ?? false) {
                            debugPrint('Proceeding with email: ${cubit.emailController.text}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnterPassword(userLogin: UserLogin(
                                  email: cubit.emailController.text,
                                ),),
                              ),
                            );
                          } else {
                            debugPrint('Form validation failed.');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill out the form correctly.')),
                            );
                          }
                        },
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Text("Don't have an Account ?"),
                          TextButton(
                            onPressed: () {
                              AppNavigators.push(context, AppRoutes.signUp);
                            },
                            child: const Text('Create One',
                                style:
                                    TextStyle(color: AppColors.buttonTextColor)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
