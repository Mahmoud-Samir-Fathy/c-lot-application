import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.secondBackground,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(

          children: [
             Icon(Icons.favorite_outline,size: 30.sp,),
            SizedBox(
              width: 15.w,
            ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My Favourites',style: TextStyle(color: AppColors.buttonTextColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                const Text('12 products',style: TextStyle(color: AppColors.searchColor),),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  AppNavigators.push(context, AppRoutes.favourites);
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
      ),
    );
  }
}
