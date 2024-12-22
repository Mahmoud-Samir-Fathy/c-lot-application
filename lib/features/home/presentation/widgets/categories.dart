import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/categories_manager/states.dart';
import 'package:e_commerce_app/features/home/presentation/pages/product_by_category.dart';
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
            return SizedBox(
              height: 80.h, // Set height for horizontal list
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    buildCategory(categoryList[index],context),
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                itemCount: categoryList.length,
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load categories'),
            );
          }
        },
      ),
    );
  }
}

Widget buildCategory(CategoriesEntity category,context) => GestureDetector(
  onTap: (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductByCategory(categoriesEntity: category,),
      ),
    );
  },
  child: SizedBox(
        width: 80.w,
        height: 80.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 4.h),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
);
