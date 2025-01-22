import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.secondBackground,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: BlocBuilder<GetUserCubit, GetUserStates>(
          builder: (context, state) {
            if (state is GetUserSuccessState) {
              final userInfo = state.user;
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${userInfo.firstName} ${userInfo.lastName}",
                        style: TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        userInfo.email,
                        style: const TextStyle(color: AppColors.searchColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Text('01150324699',
                          style: TextStyle(color: AppColors.searchColor)),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: AppColors.primary),
                      ))
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
