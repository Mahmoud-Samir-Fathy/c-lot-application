import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  final CartEntity cart;

  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.secondBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: AppColors.buttonTextColor,
                child: Image(
                  height: 80,
                  width: 80,
                  image: NetworkImage(cart.productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cart.productTitle,
                          style: const TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${cart.productPrice}",
                        style: const TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Size - ',
                        style: TextStyle(
                          color: AppColors.searchColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${cart.productSize}",
                        style: const TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Color - ',
                        style: TextStyle(
                          color: AppColors.searchColor,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        cart.productColor,
                        style: const TextStyle(
                          color: AppColors.buttonTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),

                      BlocBuilder<CartCubit, CartStates>(
                        builder: (context, state) {
                          var cubit=CartCubit.get(context);
                          return GestureDetector(
                            onTap: (){
                              cubit.removeItemsFromCart(cart);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.primary
                              ),
                              child: Icon(Icons.remove, size: 30.sp,),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
