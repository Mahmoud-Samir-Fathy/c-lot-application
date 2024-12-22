import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/states.dart';
import 'package:e_commerce_app/features/home/presentation/pages/product_by_category.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryCubit>()..getCategory(),
      child: BlocConsumer<GetCategoryCubit, GetCategoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetCategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetCategorySuccessState) {
            final categoryList = state.category;
            return Scaffold(
                appBar: const BasicAppbar(
                  hideBack: false,
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shop By Categories',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 30.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  buildCategories(context, categoryList[index]),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                  ),
                              itemCount: categoryList.length)),
                    ],
                  ),
                ));
          } else {
            return const Center(
              child: Text('Failed to load categories'),
            );
          }
        },
      ),
    );
  }
  Widget buildCategories(context, CategoriesEntity category) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductByCategory(categoriesEntity: category,),
        ),
      );
    },
    child: Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.secondBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 29.r,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Image.network(
                category.image,
                fit: BoxFit.cover,
                height: 80.h,
                width: 80.w,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(category.title)
        ],
      ),
    ),
  );

}

