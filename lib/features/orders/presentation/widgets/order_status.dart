import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatus extends StatelessWidget {
  final String orderStatus;
  final Timestamp orderDate;

  const OrderStatus(
      {super.key, required this.orderStatus, required this.orderDate});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = orderDate.toDate();
    String monthAndDay = '${_getMonthName(dateTime.month)} ${dateTime.day}';

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: orderStatus == 'Delivered'
                  ? AppColors.primary
                  : AppColors.buttonTextColor,
              child: const Icon(Icons.check, color: AppColors.buttonTextColor),
            ),
            SizedBox(width: 10.w),
            Text(
              'Delivered',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
            const Spacer(),
            Text(
              monthAndDay,
              style: TextStyle(
                color: orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor:
                  orderStatus == 'Shipped' || orderStatus == 'Delivered'
                      ? AppColors.primary
                      : AppColors.buttonTextColor,
              child: const Icon(Icons.check, color: AppColors.buttonTextColor),
            ),
            SizedBox(width: 10.w),
            Text(
              'Shipped',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: orderStatus == 'Shipped' || orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
            const Spacer(),
            Text(
              monthAndDay,
              style: TextStyle(
                color: orderStatus == 'Shipped' || orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: orderStatus == 'OrderConfirmed' ||
                      orderStatus == 'Shipped' ||
                      orderStatus == 'Delivered'
                  ? AppColors.primary
                  : AppColors.buttonTextColor,
              child: const Icon(Icons.check, color: AppColors.buttonTextColor),
            ),
            SizedBox(width: 10.w),
            Text(
              'OrderConfirmed',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: orderStatus == 'OrderConfirmed' ||
                        orderStatus == 'Shipped' ||
                        orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
            const Spacer(),
            Text(
              monthAndDay,
              style: TextStyle(
                color: orderStatus == 'OrderConfirmed' ||
                        orderStatus == 'Shipped' ||
                        orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: orderStatus == 'OnProcessing' ||
                      orderStatus == 'OrderConfirmed' ||
                      orderStatus == 'Shipped' ||
                      orderStatus == 'Delivered'
                  ? AppColors.primary
                  : AppColors.buttonTextColor,
              child: const Icon(Icons.check, color: AppColors.buttonTextColor),
            ),
            SizedBox(width: 10.w),
            Text(
              'OrderPlaced',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: orderStatus == 'OnProcessing' ||
                        orderStatus == 'OrderConfirmed' ||
                        orderStatus == 'Shipped' ||
                        orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
            const Spacer(),
            Text(
              monthAndDay,
              style: TextStyle(
                color: orderStatus == 'OnProcessing' ||
                        orderStatus == 'OrderConfirmed' ||
                        orderStatus == 'Shipped' ||
                        orderStatus == 'Delivered'
                    ? AppColors.buttonTextColor
                    : AppColors.searchColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Unknown';
    }
  }
}
