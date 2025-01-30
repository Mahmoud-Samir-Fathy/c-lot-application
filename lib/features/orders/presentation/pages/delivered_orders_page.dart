import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/empty_orders.dart';

class DeliveredOrdersPage extends StatelessWidget {
  const DeliveredOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<OrderCubit>()..getDeliveredOrder(),
        child: BlocBuilder<OrderCubit, OrdersStates>(
          builder: (context, state) {
            if (state is GetDeliveredOrderSuccessState) {
              final list = state.orders;
              if (list.isEmpty) {
                return const EmptyOrders();
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  final order = list[index];
                  return OrderWidget(
                    orderId: order.id.toString(),
                    itemCounts: order.itemCount,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: list.length,
              );
            } else if (state is GetDeliveredOrderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const EmptyOrders();
            }
          },
        ),
      ),
    );
  }
}
