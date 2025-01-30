import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/delivered_orders_page.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/on_process_orders_page.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/returned_orders_page.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/cancelled_orders_page.dart';
import 'package:e_commerce_app/features/orders/presentation/pages/shipped_orders_page.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersScreen extends StatelessWidget {
  final List<String> filters = [
    "Processing",
    "Shipped",
    "Delivered",
    "Returned",
    "Cancelled",
  ];

  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: filters.length,
      child: Scaffold(
        appBar: const BasicAppbar(
          hideBack: true,
          title: Text('Orders'),
        ),
        body: Column(
          children: [
            SizedBox(height: 16.h),
            Material(
              color: AppColors.transparent,
              child: TabBar(
                dividerColor: AppColors.transparent,
                isScrollable: true,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                tabs: filters.map((filter) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.primary,
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Text(
                        filter,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.buttonTextColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: TabBarView(
                children: filters.map((filter) {
                  switch (filter) {
                    case "Processing":
                      return const OnProcessOrdersPage();
                    case "Shipped":
                      return const ShippedOrdersPage();
                    case "Delivered":
                      return const DeliveredOrdersPage();
                    case "Returned":
                      return const ReturnedOrdersPage();
                    case "Cancelled":
                      return const CancelledOrdersPage();
                    default:
                      return const Center(child: Text('No page found'));
                  }
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}