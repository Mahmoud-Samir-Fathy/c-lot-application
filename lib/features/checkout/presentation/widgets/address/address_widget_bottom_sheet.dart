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
        return Container(
          color: AppColors.secondBackground,
          child: Padding(
            padding: EdgeInsets.all(8.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your Address and be specific:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: AppColors.buttonTextColor),
                ),
                SizedBox(height: 15.h),
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
                        mustHave50Characters: true,
                        onChanged: (value){
                          cubit.updateAddress(value);
                        },
                        onSubmit: (value) {
                          if (value.length >= 50) {
                            cubit.updateAddress(value);
                            Navigator.pop(context);
                          } else {
                            showCustomSnackBar(context, 'Address must be at least 50 characters');
                          }
                        },
                        controller: cubit.addressController,
                        hint: 'Your Address',
                      ),
                    ),
                  ),
                ),
                if (state is OrderRegisterLoadingState)
                  const Center(child: CircularProgressIndicator()), // Show loading state
              ],
            ),
          ),
        );
      },
    );
  }

  void showCustomSnackBar(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0.h,
        left: 20.0.w,
        right: 20.0.w,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
