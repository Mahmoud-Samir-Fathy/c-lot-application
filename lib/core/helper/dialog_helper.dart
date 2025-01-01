import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogHelper {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String positiveButtonText,
    required String negativeButtonText,
    required VoidCallback onPositivePressed,
    required VoidCallback onNegativePressed,
    Color? positiveButtonColor,
    Color? negativeButtonColor,
    Color? borderColor,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: AlignmentDirectional.center,
            child: Text(title),
          ),
          content: SizedBox(
            height: 100.h,
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ),
          actions: [
            Container(
              height: 50.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: negativeButtonColor ?? AppColors.primary,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: borderColor ?? AppColors.secondBackground),
              ),
              child: MaterialButton(
                height: 50.h,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
                onPressed: onNegativePressed,
                child: Text(
                  negativeButtonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 50.h,
              width: 120.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: positiveButtonColor ?? AppColors.primary),
              ),
              child: MaterialButton(
                color: positiveButtonColor ?? AppColors.primary,
                height: 50.h,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                ),
                onPressed: onPositivePressed,
                child: Text(
                  positiveButtonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
