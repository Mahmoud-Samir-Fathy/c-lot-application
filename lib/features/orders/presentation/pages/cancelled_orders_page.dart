import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/on_processing_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/empty_orders.dart';

class CancelledOrdersPage extends StatelessWidget {
  const CancelledOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<OrderCubit>()..getCancelledOrder(),
        child: BlocBuilder<OrderCubit, OrdersStates>(
          builder: (context, state) {
            if (state is GetCancelledOrderSuccessState) {
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
            } else if (state is GetCancelledOrderLoadingState) {
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
