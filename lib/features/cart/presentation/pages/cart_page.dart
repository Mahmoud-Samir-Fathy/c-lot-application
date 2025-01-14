import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/checkout_widget.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/empty_cart.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => sl<CartCubit>()..getItemsFromCart(),
        child: BlocConsumer<CartCubit, CartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetFromCartSuccessState) {
              List<CartEntity> cartItem = state.cart;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItem(
                          cart: cartItem[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.h),
                        itemCount: state.cart.length,
                      ),
                    ),
                    CheckoutWidget(
                      product: cartItem,
                    ),
                  ],
                ),
              );
            } else if (state is CartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return const EmptyCart();
          },
        ),
      ),
    );
  }
}
