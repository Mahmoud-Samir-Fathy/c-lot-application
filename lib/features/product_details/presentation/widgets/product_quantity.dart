import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/product_details/presentation/manager/quantity_manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuantityCubit, int>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit=QuantityCubit.get(context);
        return Container(
          height: 60.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.secondBackground),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Row(
              children: [
                const Text('Quantity'),
                const Spacer(),
                FloatingActionButton(
                    heroTag: '1',
                    onPressed: () {
                      cubit.increaseQuantity();
                    },
                    backgroundColor: AppColors.primary,
                    mini: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.add)),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  '${cubit.state}',
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 8.w,
                ),
                FloatingActionButton(
                    heroTag: '2',
                    onPressed: () {
                      cubit.decreaseQuantity();
                    },
                    backgroundColor: AppColors.primary,
                    mini: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.remove)),
              ],
            ),
          ),
        );
      },
    );
  }
}
