import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/cart/domain/entities/get_from_cart_entity.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/states.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:e_commerce_app/features/cart/presentation/widgets/checkout_widget.dart';
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
        create: (context) => sl<GetFromCartCubit>()..getItemsFromCart(),
        child: BlocConsumer<GetFromCartCubit, GetFromCartStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetFromCartSuccessState) {
              List<GetFromCartEntity> cartItem = state.cart;
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => CartItem(cart: cartItem[index],),
                        separatorBuilder: (context, index) => SizedBox(height: 10.h),
                        itemCount: state.cart.length,
                      ),
                    ),
                     CheckoutWidget(product: cartItem,),
                  ],
                ),
              );
            }else if(state is GetFromCartLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage(AppImages.emptyCart)),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Your Cart Is Empty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Container(
                          color: AppColors.primary,
                          child: MaterialButton(
                            onPressed: () {},
                            child:  Text(
                              'Explore Categories',
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                          )))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
