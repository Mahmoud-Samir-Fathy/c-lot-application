import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.secondBackground),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            children: [
              Icon(
                Icons.archive,
                size: 45.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order  #####################',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Text('No of items:4'),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(

                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
