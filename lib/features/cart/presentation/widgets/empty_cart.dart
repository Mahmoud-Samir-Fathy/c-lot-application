import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(AppImages.emptyCart)),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Your Cart Is Empty',
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Container(
                  color: AppColors.primary,
                  child: MaterialButton(
                    onPressed: () {
                      AppNavigators.push(context, AppRoutes.categories);
                    },
                    child: Text(
                      'Explore Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  )))
        ],
      ),
    );
  }
}
