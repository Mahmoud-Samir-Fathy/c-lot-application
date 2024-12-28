import 'package:e_commerce_app/core/asset_manager/app_victors.dart';
import 'package:e_commerce_app/core/helper/cart_helper.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutWidget extends StatelessWidget {
  final List<GetFromCartEntity> product;

  const CheckoutWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
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
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.secondBackground),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppVictors.coupon,
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Spacer(),
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColors.primary),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15.sp,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: AppColors.primary,
              ),
              width: double.infinity,
              height: 50.h,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      color: AppColors.buttonTextColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
