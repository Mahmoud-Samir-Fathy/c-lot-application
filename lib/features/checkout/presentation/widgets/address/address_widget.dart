import 'package:e_commerce_app/core/helper/app_bottom_sheet.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/states.dart';
import 'package:e_commerce_app/features/checkout/presentation/widgets/address/address_widget_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidget extends StatelessWidget {

  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 8.w),
        child: Row(
          children: [
            BlocBuilder<OrderRegisterCubit, OrderRegisterStates>(
              builder: (context, state) {
                if(state is AddressChangeState){
                  var addressText=OrderRegisterCubit.get(context).address;
                  return Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Address',
                          style: TextStyle(
                              color: AppColors.searchColor, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          addressText!,
                          style: TextStyle(
                              color: AppColors.buttonTextColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }
                return Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Address',
                        style: TextStyle(
                            color: AppColors.searchColor, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Add Shipping Address',
                        style: TextStyle(
                            color: AppColors.buttonTextColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );

              },
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  AppBottomSheet.display(
                      context,
                      BlocProvider.value(
                        value: BlocProvider.of<OrderRegisterCubit>(context),
                        child: const AddressWidgetBottomSheet(),
                      ));
                },
                child: const Icon(Icons.arrow_forward_ios_outlined))
          ],
        ),
      ),
    );
  }
}
