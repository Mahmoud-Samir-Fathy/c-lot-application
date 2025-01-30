import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderWidget extends StatelessWidget {
  final String orderId;
  final int itemCounts;

  const OrderWidget(
      {super.key, required this.orderId, required this.itemCounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
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
                    Text(
                      'Order #$orderId',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('$itemCounts items'),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    AppNavigators.push(context, AppRoutes.orderDetails);
                  },
                  icon: const Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
