import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAddress extends StatelessWidget {
  final AddressEntity address;

  const UserAddress(
      {super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.secondBackground),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${address.stAddress},${address.city},${address.state},${address.zipCode}', style: TextStyle(
                        fontSize: 15.sp, color: AppColors.buttonTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 15.h,)
                  ],
                ),
              ),
              const Spacer(),
              BlocBuilder<SettingsCubit, SettingsStates>(
                builder: (context, state) {
                  var cubit=SettingsCubit.get(context);
                  return TextButton(
                      onPressed: () {
                        cubit.deleteAddress(address);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: AppColors.red),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
