import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/hex_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/color_manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColorBottomSheet extends StatelessWidget {
  final ProductEntity product;

  const ProductColorBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorCubit, int>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ColorCubit.get(context);

        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    buildColorItem(cubit, product, index, context),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
                itemCount: product.colors.length,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildColorItem(
      ColorCubit cubit, ProductEntity product, int index, context) {
    bool isSelected = cubit.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        cubit.selectedColor(index);
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
            padding: EdgeInsets.only(left: 15.0.w),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                children: [
                  Text(product.colors[index].title),
                  const Spacer(),
                  CircleAvatar(
                    radius: 10.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Container(
                        color: HexColor(product.colors[index].hexcolor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),

                  isSelected
                      ? Icon(
                          Icons.check,
                          size: 25.sp,
                        )
                      : Padding(
                        padding:  EdgeInsets.only(left: 25.0.w),
                        child: Container(),
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
