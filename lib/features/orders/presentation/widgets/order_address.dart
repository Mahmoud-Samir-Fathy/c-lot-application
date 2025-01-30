import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderAddress extends StatelessWidget {
  const OrderAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping details',
          style: TextStyle(
              color: AppColors.buttonTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.secondBackground),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 8.h),
              child: const Text(
                  'asdklasdjasjdjlkasdaaaaaaaaaaaaaakjlasdjlkasjlkdjlkasdkjlasdjklasdjklasd'),
            ),
          ),
        ),
      ],
    );
  }
}
