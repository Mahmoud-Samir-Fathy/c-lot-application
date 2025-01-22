import 'package:e_commerce_app/core/widgets/product_item.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
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
                             (index) => buildProductItem(categoryList[index],context))),
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

