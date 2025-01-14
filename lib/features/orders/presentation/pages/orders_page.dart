import 'package:e_commerce_app/features/orders/presentation/widgets/order_widget.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        title: Text('Orders'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => const OrderWidget(),
          separatorBuilder: (context, index) => SizedBox(height: 5.h,),
          itemCount: 5),
    );
  }
}
