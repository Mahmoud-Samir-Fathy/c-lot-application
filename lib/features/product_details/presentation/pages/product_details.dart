import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
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
        BlocProvider<ColorCubit>(create: (context) => ColorCubit())
      ],
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {},
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
                  SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: MaterialButton(
                      onPressed: () {},
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Row(
                        children: [
                          BlocBuilder<QuantityCubit, int>(
                            builder: (context, state) {
                              var cubit=QuantityCubit.get(context);
                              var price=cubit.calculateTotalPrice(quantity: state, price: product.price);
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
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
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
