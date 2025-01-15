import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/settings_widgets/edit_widget.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/settings_widgets/user_image.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/settings_widgets/user_info.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          hideBack: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: UserImage()),
              SizedBox(
                height: 30.h,
              ),
              const UserInfo(),
              SizedBox(
                height: 25.h,
              ),
              CustomWidgetSetting(text: 'Address', onPressed: () {}),
              SizedBox(
                height: 10.h,
              ),
              CustomWidgetSetting(
                  text: 'Wishlist',
                  onPressed: () {
                    AppNavigators.push(context, AppRoutes.wishList);
                  }),
              SizedBox(
                height: 10.h,
              ),
              CustomWidgetSetting(text: 'Payment', onPressed: () {}),
              SizedBox(
                height: 10.h,
              ),
              CustomWidgetSetting(text: 'Help', onPressed: () {}),
              SizedBox(
                height: 10.h,
              ),
              CustomWidgetSetting(text: 'Support', onPressed: () {}),
              const Spacer(),
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      )))
            ],
          ),
        ));
  }
}
