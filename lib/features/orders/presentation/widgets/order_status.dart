import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.buttonTextColor,
            ),
            SizedBox(width: 10.w,),
            Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18.sp),),
            const Spacer(),
            const Text('28 May')
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.buttonTextColor,
            ),
            SizedBox(width: 10.w,),
            Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18.sp),),
            const Spacer(),
            const Text('28 May')
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.buttonTextColor,
            ),
            SizedBox(width: 10.w,),
            Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18.sp),),
            const Spacer(),
            const Text('28 May')
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.buttonTextColor,
            ),
            SizedBox(width: 10.w,),
            Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18.sp),),
            const Spacer(),
            const Text('28 May')
          ],
        ),
        SizedBox(height: 30.h,),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.buttonTextColor,
            ),
            SizedBox(width: 10.w,),
            Text('Delivered',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18.sp),),
            const Spacer(),
            const Text('28 May')
          ],
        ),
      ],
    );
  }
}
