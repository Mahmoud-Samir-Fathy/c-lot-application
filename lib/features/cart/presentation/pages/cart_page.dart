import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {

  const CartPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => sl<GetFromCartCubit>()..getItemsFromCart(),
        child: BlocConsumer<GetFromCartCubit, GetFromCartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetFromCartSuccessState) {
              List<GetFromCartEntity> cartItem = state.cart;
              return ListView.separated(
                itemBuilder: (context, index) => buildCartItem(cartItem[index]),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount: state.cart.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildCartItem(GetFromCartEntity cart) =>
      Container(
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
                child: Image(
                  height: 80,
                  width: 80,
                  image: NetworkImage(cart.productImage),
                  fit: BoxFit.cover,
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

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.primary
                          ),
                          child: Icon(Icons.remove,size: 30.sp,),
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


