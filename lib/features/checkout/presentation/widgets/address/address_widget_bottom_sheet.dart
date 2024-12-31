import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/states.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressWidgetBottomSheet extends StatelessWidget {
  const AddressWidgetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderRegisterCubit, OrderRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OrderRegisterCubit.get(context);
        return Form(
          child: Container(
            color: AppColors.secondBackground,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                key: cubit.formKey,
                children: [
                  Text(
                    'Enter your Address and be specific:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: AppColors.buttonTextColor),
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.buttonTextColor),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h),
                        child: CustomTextFormFieldWidget(
                          onSubmit: (value){
                            cubit.addressChange(value);
                            Navigator.pop(context);
                          },

                          controller: cubit.addressController,
                          hint: 'Your Address',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
