import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/address_widgets/user_address.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          title: const Text('Address'),
          action: TextButton(
              onPressed: () {
                AppNavigators.push(context, AppRoutes.editAddress);
              },
              child: const Text(
                '+Add',
                style: TextStyle(color: AppColors.primary),
              )),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => const UserAddress(),
            separatorBuilder: (context, index) => SizedBox(
                  height: 15.h,
                ),
            itemCount: 10)

        //UserAddress(),
        );
  }
}
