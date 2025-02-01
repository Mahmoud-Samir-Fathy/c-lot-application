import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItems extends StatelessWidget {
  final int itemsCount;
  const OrderItems({super.key, required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Order Items', style: TextStyle(
        color: AppColors.buttonTextColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold),),
        SizedBox(height: 15.h,),
        Container(
          height: 90.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.secondBackground),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Row(
              children: [
                Icon(
                  Icons.archive,
                  size: 45.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                 Text('$itemsCount items'),
                const Spacer(),
                TextButton(onPressed: (){}, child: const Text('View all',style: TextStyle(color: AppColors.primary),))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
