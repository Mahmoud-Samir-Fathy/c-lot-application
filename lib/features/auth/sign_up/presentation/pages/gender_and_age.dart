import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/helper/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/manager/states.dart';
import 'package:e_commerce_app/features/auth/sign_up/presentation/widgets/age_range.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/features/auth/sign_up/domain/entities/register_entity.dart';

class GenderAndAge extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const GenderAndAge({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            AppNavigators.pushAndReplacement(context, AppRoutes.home);
          } else if (state is SignUpErrorState) {
            SnackBar(
              content: Text('Error in sign Up ${state.message}'),
            );
          }
        },
        builder: (context, state) {
          final cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: const BasicAppbar(hideBack: false),
            body: ConditionalBuilder(
              condition: state is SignUpSuccessState,
              builder: (context)=>Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tell Us About Yourself',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => cubit.selectGender(true),
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: cubit.isMan
                                    ? AppColors.primary
                                    : AppColors.secondBackground,
                              ),
                              child: Center(
                                child: Text(
                                  'Man',
                                  style: TextStyle(
                                    color: AppColors.buttonTextColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => cubit.selectGender(false),
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: !cubit.isMan
                                    ? AppColors.primary
                                    : AppColors.secondBackground,
                              ),
                              child: Center(
                                child: Text(
                                  'Woman',
                                  style: TextStyle(
                                    color: AppColors.buttonTextColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      'How old are you?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 25.h),
                    GestureDetector(
                      onTap: () {
                        AppBottomSheet.display(
                          context,
                          AgeRange(
                            onSelect: (ageRange) =>
                                cubit.selectAgeRange(ageRange),
                          ),
                        );
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.secondBackground,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: Row(
                            children: [
                              Text(cubit.selectedAgeRange),
                              const Spacer(),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0.h),
                      child: CustomMaterialButton(
                          text: 'Finish',
                          onPressed: () {
                            if (cubit.selectedAgeRange == 'Age Range') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text('Please select your age range.')),
                              );
                              return;
                            }
                            // Collect all user data
                            final user = UserRegister(
                              firstName: firstName,
                              lastName: lastName,
                              email: email,
                              password: password,
                              gender: cubit.isMan ? "Male" : "Female",
                              age: cubit.selectedAgeRange,
                            );
                            cubit.signUp(user, context);
                          }),
                    )
                  ],
                ),
              ),
              fallback: (context)=>const CircularProgressIndicator(),

            ),
          );
        },
      ),
    );
  }
}
