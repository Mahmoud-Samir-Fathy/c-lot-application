import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/helper/cart_helper.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckoutButton extends StatelessWidget {
  final List<CartEntity> product;

  const CheckoutButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Subtotal',
                  style:
                  TextStyle(color: AppColors.searchColor, fontSize: 15.sp),
                ),
                const Spacer(),
                Text('\$${CartHelper.calculatingSubTotal(product)}'),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Shipping Cost',
                  style:
                  TextStyle(color: AppColors.searchColor, fontSize: 15.sp),
                ),
                const Spacer(),
                const Text('\$${8}'),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Tax',
                  style:
                  TextStyle(color: AppColors.searchColor, fontSize: 15.sp),
                ),
                const Spacer(),
                const Text('\$${0}'),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style:
                  TextStyle(color: AppColors.searchColor, fontSize: 15.sp),
                ),
                const Spacer(),
                Text(
                  '\$${CartHelper.calculatingSubTotal(product)+8}',)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.primary,
              ),
              width: double.infinity,
              height: 50.h,
              child: MaterialButton(
                onPressed: () {
                  AppNavigators.push(context, AppRoutes.orderSuccessful);
                },
                child: Row(
                  children: [
                    Text('\$${CartHelper.calculatingSubTotal(product)+8}'),
                    const Spacer(),
                    Text(
                      'Place Order',
                      style: TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
