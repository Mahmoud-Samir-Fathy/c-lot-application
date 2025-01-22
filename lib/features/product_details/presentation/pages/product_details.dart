import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/favourite_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/domain/entities/add_to_cart_entity.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/add_to_cart_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/add_to_cart_manager/states.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/color_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/quantity_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/size_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_color_widget/product_color.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_image.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_quantity.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_size_widget/product_size.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SizeCubit>(create: (context) => SizeCubit()),
        BlocProvider<QuantityCubit>(create: (context) => QuantityCubit()),
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<AddToCartCubit>(create: (context) => sl<AddToCartCubit>()),
        BlocProvider<FavouriteCubit>(
          create: (context) {
            final cubit = sl<FavouriteCubit>();
            cubit.initializeFavouriteStatus(product.productId); // Initialize state
            return cubit;
          },
        ),

      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: BlocBuilder<FavouriteCubit, bool>(
            builder: (context, state) {
              var cubit = FavouriteCubit.get(context);
              return IconButton(
                icon: state
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
                onPressed: () {
                  cubit.onTap(product);
                },
              );
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: SizedBox(
                  height: 300.h, child: ProductImage(product: product)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${product.price.toString()}',
                        style: const TextStyle(color: AppColors.primary),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        product.discountPrice == 0
                            ? ''
                            : '${product.price + product.discountPrice} L.E',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.searchColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ProductSize(
                    product: product,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ProductColor(
                    product: product,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ProductQuantity(),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<AddToCartCubit, AddToCartStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = AddToCartCubit.get(context);
                      if (state is AddToCartLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        height: 60.h,
                        child: MaterialButton(
                          onPressed: () {
                            var sizeCubit = SizeCubit.get(context);
                            var colorCubit = ColorCubit.get(context);
                            var quantityCubit = QuantityCubit.get(context);
                            int quantity = quantityCubit.state;
                            double totalPrice =
                                quantity * product.price.toDouble();
                            String selectedColor =
                                product.colors[colorCubit.selectedIndex].title;
                            cubit.addToCart(
                                AddToCartEntity(
                                    productId: product.productId,
                                    productTitle: product.title,
                                    productSize:
                                        product.sizes[sizeCubit.selectedIndex],
                                    productColor: selectedColor,
                                    productImage: product.image[0],
                                    addToCartDate: Timestamp.now(),
                                    productQuantity: quantity,
                                    totalPrice: totalPrice,
                                    productPrice: product.price.toDouble()),
                                context);
                          },
                          color: AppColors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Row(
                            children: [
                              BlocBuilder<QuantityCubit, int>(
                                builder: (context, state) {
                                  var cubit = QuantityCubit.get(context);
                                  var price = cubit.calculateTotalPrice(
                                      quantity: state, price: product.price);
                                  return Text(
                                    '\$${price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  );
                                },
                              ),
                              const Spacer(),
                              Text(
                                'Add to Bag',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
