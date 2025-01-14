import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.secondBackground,
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 30.0.h),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_on_outlined,
                  size: 45.sp,
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: Text(

                    'Mahmoud ,you have Placed and Order check your order history for full details',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13.sp, height: 1.5, ),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
