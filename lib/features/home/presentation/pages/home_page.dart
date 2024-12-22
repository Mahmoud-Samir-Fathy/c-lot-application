import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/new_in.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/search.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                const Search(),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    const Text(
                      'Categories',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        AppNavigators.push(context, AppRoutes.categories);
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(color: AppColors.buttonTextColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                const Categories(),
                SizedBox(height: 15.h),
                const Row(
                  children: [
                    Text(
                      'Top Selling',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(color: AppColors.buttonTextColor),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                const TopSelling(),
                SizedBox(height: 15.h),
                const Row(
                  children: [
                    Text(
                      'New In',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.primary),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(color: AppColors.buttonTextColor),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                const NewInProducts()
              ],
            ),
          ),
        ));
  }
}
