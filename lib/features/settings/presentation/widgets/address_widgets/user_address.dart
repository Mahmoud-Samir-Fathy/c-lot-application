import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.secondBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '#asddddddddddddddddddddddd###########dd',style: TextStyle(fontSize:15.sp,color: AppColors.buttonTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15.h,)
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: AppColors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
