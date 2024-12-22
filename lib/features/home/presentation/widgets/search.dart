import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigators.push(context, AppRoutes.search);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.r), // Circular corners for the entire container
        child: Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.secondBackground
          ),
          child: Row(
            children: [
              const Icon(Icons.search,color: AppColors.searchColor,),
              SizedBox(width: 10.w,),
              const Text('Search',style: TextStyle(color:  AppColors.searchColor),)
            ],
          ),
        ),
      ),
    );
  }
}

