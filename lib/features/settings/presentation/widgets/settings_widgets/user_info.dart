import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),  color: AppColors.secondBackground,
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16.0.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Mahmoud Samir',style: TextStyle(color: AppColors.buttonTextColor,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                SizedBox(height: 5.h,),
                const Text('MahmoudSamir0777@gmail.com',style: TextStyle(color: AppColors.searchColor),),
                SizedBox(height: 5.h,),
                const Text('01150324699',style: TextStyle(color: AppColors.searchColor)),
              ],
            ),
            const Spacer(),
            TextButton(onPressed: (){}, child: const Text('Edit',style: TextStyle(color: AppColors.primary),))
          ],
        ),
      ),
    );
  }
}
