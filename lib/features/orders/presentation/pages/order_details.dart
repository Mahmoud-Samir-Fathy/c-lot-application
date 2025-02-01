import 'package:e_commerce_app/features/checkout/domain/entities/order_registration_entity.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_address.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_items.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_status.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  final OrderRegistrationEntity orders;
  const OrderDetails({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  BasicAppbar(
        hideBack: false,
        title: Text('#${orders.id}'),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0.w),
        child: Column(
          children: [
             OrderStatus(orderStatus: orders.orderStatus,orderDate:orders.createdDate,),
            SizedBox(
              height: 30.h,
            ),
             OrderItems(itemsCount:orders.itemCount ,),
            SizedBox(
              height: 30.h,
            ),
             OrderAddress(address: orders.userAddress,)
          ],
        ),
      ),
    );
  }
}
