import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/size_manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSizeBottomSheet extends StatelessWidget {
  final ProductEntity product;

  const ProductSizeBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SizeCubit, int>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SizeCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildSizeItem(cubit, product, index, context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemCount: product.sizes.length,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSizeItem(
      SizeCubit cubit, ProductEntity product, int index, context) {
    bool isSelected = cubit.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        cubit.selectSize(index);
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: isSelected ? AppColors.primary : AppColors.secondBackground,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Row(
              children: [
                Text(
                  "${product.sizes[index]}",
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.buttonTextColor
                        : AppColors.buttonTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  Icon(
                    Icons.check,
                    size: 25.sp,
                    color: AppColors.buttonTextColor,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
