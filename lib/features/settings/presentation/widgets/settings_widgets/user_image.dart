import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.buttonTextColor,
      radius: 50.r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
          child: const Image(image: AssetImage(AppImages.defaultImage))),
    );
  }
}
