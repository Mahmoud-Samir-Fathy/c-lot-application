import 'package:e_commerce_app/features/settings/presentation/widgets/address_widgets/user_address.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text('Address'),
      ),
      body: UserAddress(),
    );
  }
}
