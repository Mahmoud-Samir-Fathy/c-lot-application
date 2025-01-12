import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:e_commerce_app/features/splash/presentation/cubit/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/asset_manager/app_victors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          if (state is Authenticated) {
            AppNavigators.pushAndReplacement(context, AppRoutes.layout);
          } else {
            AppNavigators.pushAndReplacement(context, AppRoutes.signIn);
          }
        },
        builder: (context, state) {
          return Center(
            child: SvgPicture.asset(
              AppVictors.appLogo,
              width: 100.w,
              height: 100.h,
            ),
          );
        },
      ),
    );
  }
}
