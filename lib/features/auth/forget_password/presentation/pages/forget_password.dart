import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/core/validators/app_validation.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/auth/forget_password/domain/entities/user_forget_password_entity.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/forget_password/presentation/manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserReqPassCubit>(),
      child: BlocConsumer<UserReqPassCubit, UserReqPassStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          final cubit=UserReqPassCubit.get(context);
          return Scaffold(
            appBar: const BasicAppbar(
              hideBack: false,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 80.h),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forget Password',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                     CustomTextFormFieldWidget(
                      hint: 'Enter Email Address',
                      controller: cubit.emailController,
                       validator: AppValidator.emailValidation,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomMaterialButton(
                        text: "Continue",
                        onPressed: () {
                          if(cubit.formKey.currentState!.validate()){
                            final user=UserForgetReq(
                              email: cubit.emailController.text
                            );
                            cubit.requestPassword(user, context);
                            AppNavigators.pushAndReplacement(context, AppRoutes.returnSignIn);

                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
