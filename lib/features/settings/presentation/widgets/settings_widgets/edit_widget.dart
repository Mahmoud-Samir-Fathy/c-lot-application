import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidgetSetting extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomWidgetSetting(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.secondBackground,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: AppColors.buttonTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
      ),
    );
  }
}
