import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserAddressPage extends StatelessWidget {
  const EditUserAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('Add Address'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(
          children: [
            const CustomTextFormFieldWidget(
              hint: 'Street Address',
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextFormFieldWidget(
              hint: 'City',
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                const Expanded(
                  child: CustomTextFormFieldWidget(
                    hint: 'State',
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Expanded(
                  child: CustomTextFormFieldWidget(
                    hint: 'Zip Code',
                  ),
                )
              ],
            ),
            const Spacer(),
            CustomMaterialButton(text: 'Save', onPressed: () {}),
            SizedBox(height: 20.h,)
          ],
        ),
      ),
    );
  }
}
