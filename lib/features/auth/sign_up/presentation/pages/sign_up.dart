import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/core/validators/app_validation.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/states.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/pages/gender_and_age.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: const BasicAppbar(
              hideBack: false,
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
                        'Sign Up',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                       CustomTextFormFieldWidget(
                        hint: 'First Name',
                        controller: cubit.firstNameController,
                         validator: AppValidator.firstNameValidation,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                       CustomTextFormFieldWidget(
                        hint: 'Last Name',
                         controller: cubit.lastNameController,
                         validator: AppValidator.lastNameValidation,

                       ),
                      SizedBox(
                        height: 25.h,
                      ),
                       CustomTextFormFieldWidget(
                        hint: 'Email Address',
                         controller: cubit.emailController,
                         validator: AppValidator.emailValidation,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                       CustomTextFormFieldWidget(
                        hint: 'Password',
                         controller: cubit.passwordController,
                         isPassword: true,
                         validator: AppValidator.passwordValidation,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomMaterialButton(
                        text: "Continue",
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenderAndAge(
                                  firstName: cubit.firstNameController.text,
                                  lastName: cubit.lastNameController.text,
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Text("Have Account already ?"),
                          TextButton(
                            onPressed: () {
                              AppNavigators.pushAndReplacement(
                                  context, AppRoutes.signIn);
                            },
                            child: const Text('Sign In',
                                style: TextStyle(color: AppColors.buttonTextColor)),
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
