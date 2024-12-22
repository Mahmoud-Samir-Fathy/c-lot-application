import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizeBottomSheet extends StatelessWidget {
  const ProductSizeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => buildSizeItem(),
            separatorBuilder: (context, index) => SizedBox(
              height: 15.h,
            ),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}

Widget buildSizeItem() => Padding(
  padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
  child: Container(
    height: 60.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      color: AppColors.secondBackground,
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 15.0.w),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(
          children: [
            const Text('S'),
            const Spacer(),
            Icon(
              Icons.check,
              size: 25.sp,
            )
          ],
        ),
      ),
    ),
  ),
);
