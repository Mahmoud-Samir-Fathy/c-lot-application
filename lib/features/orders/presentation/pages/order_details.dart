import 'package:e_commerce_app/features/orders/presentation/widgets/order_address.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_items.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_status.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
        title: Text('asdsadsad'),
      ),
      body: Column(
        children: [
          const OrderStatus(),
          SizedBox(
            height: 30.h,
          ),
          const OrderItems(),
          SizedBox(
            height: 30.h,
          ),
          const OrderAddress()
        ],
      ),
    );
  }
}
