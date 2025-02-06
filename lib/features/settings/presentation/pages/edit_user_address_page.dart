import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/settings/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:e_commerce_app/shared_widgets/buttons/custom_material_btn.dart';
import 'package:e_commerce_app/shared_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocProvider(
        create: (context) => sl<SettingsCubit>(),
        child: BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) {
            var cubit = SettingsCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomTextFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                      controller: cubit.stController,
                      hint: 'Street Address',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                      controller: cubit.cityController,
                      hint: 'City',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFieldWidget(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                            hint: 'State',
                            controller: cubit.stateController,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: CustomTextFormFieldWidget(
                            keyboardType: TextInputType.phone,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                            hint: 'Zip Code',
                            controller: cubit.zipCodeController,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    BlocConsumer<SettingsCubit, SettingsStates>(
                      listener: (context, state) {
                        if(state is AddAddressSuccessState){}
                        AppNavigators.pushAndReplacement(
                            context, AppRoutes.address);
                      },
                      builder: (context, state) {
                        if (state is AddAddressLoadingState) {
                          return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: AppColors.primary),
                              child: const Center(
                                child: CircularProgressIndicator(),));
                        }
                        return CustomMaterialButton(
                            text: 'Save',
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                final zipCode = int.tryParse(
                                    cubit.zipCodeController.text) ?? 0;

                                cubit.addAddress(AddressEntity(
                                  stAddress: cubit.stController.text,
                                  city: cubit.cityController.text,
                                  state: cubit.stateController.text,
                                  zipCode: zipCode, id:null ,
                                ));

                              }
                            }
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
