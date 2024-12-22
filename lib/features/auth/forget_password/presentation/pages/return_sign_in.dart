import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/asset_manager/app_images.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnSignIn extends StatelessWidget {
  const ReturnSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image:AssetImage(AppImages.sentForgetPassword)),
            SizedBox(height: 15.h,),
            const Text('We Sent an Email to reset your password.'),
            SizedBox(height: 25.h,),
            CustomMaterialButton(text: 'Return To Sign In', onPressed: (){
              AppNavigators.pushAndReplacement(context, AppRoutes.signIn);
            })
          ],
        ),
      )
    );
  }
}
