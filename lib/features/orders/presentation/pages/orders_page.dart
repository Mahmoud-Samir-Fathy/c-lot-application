import 'package:e_commerce_app/features/orders/presentation/widgets/empty_orders.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EmptyOrders(),
    );
  }
}
