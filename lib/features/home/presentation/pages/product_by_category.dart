import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/products_by_category_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/products_by_category_manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductByCategory extends StatelessWidget {
  final CategoriesEntity categoriesEntity;

  const ProductByCategory({super.key, required this.categoriesEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<GetProductsByCategoryCubit>()..getProducts(categoriesEntity.categoryId),
      child:
          BlocConsumer<GetProductsByCategoryCubit, GetProductsByCategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProductsByCategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductsByCategorySuccessState) {
            final categoryList = state.products;
            return Scaffold(
              appBar: const BasicAppbar(
                hideBack: false,
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(categoriesEntity.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(categoryList.length.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: GridView.count(
                          childAspectRatio: 1 / 1.6,
                          mainAxisSpacing: 20.sp,
                          crossAxisSpacing: 20.sp,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(categoryList.length,
                             (index) => buildProductItem(categoryList[index]))),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Products'),
            );
          }
        },
      ),
    );
  }
}

Widget buildProductItem(ProductEntity product) => ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 400.h,
        width: 180.w,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Container(
                color: AppColors.buttonTextColor,
                child: Image(
                  image: NetworkImage(product.image[0]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Product Details
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              color: AppColors.secondBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        product.price.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.buttonTextColor,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        product.discountPrice == 0
                            ? ''
                            : '${product.price + product.discountPrice} L.E',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
