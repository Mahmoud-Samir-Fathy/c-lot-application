import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/auth/sign_in/domain/entities/signIn_entity.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_in/presentation/manager/states.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPassword extends StatelessWidget {
  final UserLogin userLogin;

  const EnterPassword({super.key, required this.userLogin});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignInCubit>(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            AppNavigators.pushAndReplacement(context, AppRoutes.home);
          } else if (state is SignInErrorState) {
            SnackBar(
              content: Text('Error in sign Up ${state.message}'),
            );
          }
        },
        builder: (context, state) {
          final cubit = SignInCubit.get(context);

          return Scaffold(
            appBar: const BasicAppbar(
              hideBack: false,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 80.h),
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
                        hint: 'Password',
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter the correct Password';
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
                            if (cubit.formKey.currentState!.validate()) {
                              final user = UserLogin(
                                  email: userLogin.email,
                                  password: cubit.passwordController.text);
                              cubit.signIn(user, context);
                            }
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Text("Forget Password ?"),
                          TextButton(
                            onPressed: () {
                              AppNavigators.push(
                                  context, AppRoutes.forgetPassword);
                            },
                            child: const Text(
                              'Reset',
                              style:
                              TextStyle(color: AppColors.buttonTextColor),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
