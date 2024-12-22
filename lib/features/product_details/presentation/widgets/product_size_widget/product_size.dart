import 'package:e_commerce_app/core/helper/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_size_widget/product_size_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSize extends StatelessWidget {
  const ProductSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: AppColors.secondBackground
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 15.0.w),
        child: Row(
          children: [
            const Text('Size'),
            const Spacer(),
            const Text('S'),
            SizedBox(width: 5.w,),
            IconButton(onPressed: (){
              AppBottomSheet.display(
                  context,
                  const ProductSizeBottomSheet()

              );
            }, icon: Icon(Icons.keyboard_arrow_down_sharp,size: 25.sp,))
          ],
        ),
      ),
    );
  }
}
