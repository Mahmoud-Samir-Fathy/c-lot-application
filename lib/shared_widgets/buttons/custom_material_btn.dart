import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_text.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? borderColor; // Border color for the button
  final Color? color; // Background color for the button
  final double? borderWidth; // Thickness of the border

  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.color,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0.h, // Responsive height
      width: double.infinity, // Full-width button
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0.r), // Rounded corners
        border: Border.all(
          color: borderColor ?? AppColors.primary, // Default border color
          width: borderWidth ?? 0.0, // Default border width
        ),
      ),
      child: MaterialButton(
        color: color ?? AppColors.primary, // Default background color
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0.r),
        ),
        child: CustomTextWidget(
          text: text,
          textStyle: textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
