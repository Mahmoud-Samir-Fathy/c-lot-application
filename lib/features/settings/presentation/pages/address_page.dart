import 'package:e_commerce_app/config/routes.dart';
import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/utilis/helpers/app_navigators.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/states.dart';
import 'package:e_commerce_app/features/settings/presentation/widgets/address_widgets/user_address.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<SettingsCubit>()..getAddress(),
        child: BlocBuilder<SettingsCubit, SettingsStates>(
          builder: (context, state) {
            if (state is GetAddressLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAddressErrorState) {
              return Center(
                  child: Text(state.message,
                      style: const TextStyle(color: Colors.red)));
            } else if (state is GetAddressSuccessState) {
              final addresses = state.address;
              if (addresses.isEmpty) {
                return const Center(child: Text('No addresses found.'));
              }
              return ListView.separated(
                itemBuilder: (context, index) => UserAddress(address: addresses[index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: addresses.length,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
