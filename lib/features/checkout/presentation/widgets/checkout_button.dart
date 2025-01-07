import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/helper/cart_helper.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  '\$${CartHelper.calculatingSubTotal(product) + 8}',
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<OrderRegisterCubit, OrderRegisterStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is OrderRegisterLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.primary,
                    ),
                    width: double.infinity,
                    height: 50.h,
                    child: MaterialButton(
                      onPressed: () {
                        var cubit = context.read<OrderRegisterCubit>();
                        if (cubit.addressController.text.isNotEmpty&&cubit.addressController.text.length>=50) {
                          cubit.registerOrder(
                            OrderRegistrationEntity(
                              userAddress: cubit.addressController.text,
                              products: product,
                              totalPrice:
                                  CartHelper.calculatingSubTotal(product) +
                                      8.toDouble(),
                              itemCount: product.length,
                              createdDate: Timestamp.now(),
                            ),
                            context,
                          );
                        }
                        else if(cubit.addressController.text.length<50){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Address must be at least 50 characters'),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please Enter you Address'),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                              '\$${CartHelper.calculatingSubTotal(product) + 8}'),
                          const Spacer(),
                          Text(
                            'Place Order',
                            style: TextStyle(
                              color: AppColors.buttonTextColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
