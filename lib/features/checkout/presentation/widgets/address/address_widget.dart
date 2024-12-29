import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.0.h,horizontal: 8.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shipping Address',style: TextStyle(color: AppColors.searchColor,fontSize: 15.sp),),
                SizedBox(height: 10.h,),
                Text('Add Shipping Address',style: TextStyle(color: AppColors.buttonTextColor,fontSize: 18.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
