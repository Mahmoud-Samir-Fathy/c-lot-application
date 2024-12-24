import 'package:e_commerce_app/core/helper/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/hex_colors.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/color_manager/cubit.dart';
import 'package:e_commerce_app/features/product_details/presentation/widgets/product_color_widget/product_color_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatelessWidget {
  final ProductEntity product;

  const ProductColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: AppColors.secondBackground
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.0.w),
        child: Row(
          children: [
            const Text('Color'),
            const Spacer(),
            CircleAvatar(
              radius: 10.r,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: BlocBuilder<ColorCubit, int>(
                    builder: (context, state) {
                      return Container(color: HexColor(product.colors[state].hexcolor,));
                    },
                  )),
            ),
            SizedBox(width: 5.w,),
            IconButton(onPressed: () {
              AppBottomSheet.display(
                  context,
                  BlocProvider.value(
                    value: BlocProvider.of<ColorCubit>(context),
                    child: ProductColorBottomSheet(product: product,),
                  )

              );
            }, icon: Icon(Icons.keyboard_arrow_down_sharp, size: 25.sp,))
          ],
        ),
      ),
    );
  }
}
