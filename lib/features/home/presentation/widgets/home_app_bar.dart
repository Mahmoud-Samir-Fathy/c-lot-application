import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/app_bar_manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetUserCubit>()..getUser(),
      child: BlocConsumer<GetUserCubit, GetUserStates>(
        listener: (context, state) {
          if (state is GetUserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is GetUserLoadingState || state is GetUserErrorState) {
            return AppBar(
              backgroundColor: AppColors.transparent,
              title: const CircularProgressIndicator(),
              centerTitle: true,
            );
          } else if (state is GetUserSuccessState) {
            final user = state.user;
            return AppBar(
              backgroundColor: AppColors.transparent,

              centerTitle: true,
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    user.image.isNotEmpty ? user.image : AppImages.defaultImage,
                    fit: BoxFit.cover,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ),
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.secondBackground,
                ),
                child: Text(
                  user.gender,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // AppNavigators.push(context, AppRoutes.cart);
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            );
          }
          return AppBar(
            backgroundColor: AppColors.transparent,
            title: const Text("Home"),
            centerTitle: true,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
