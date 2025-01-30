import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/onProcess/on_processing_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/onProcess/on_processing_empty_orders.dart';

class ReturnedOrdersPage extends StatelessWidget {
  const ReturnedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<OrderCubit>()..getReturnedOrder(),
        child: BlocBuilder<OrderCubit, OrdersStates>(
          builder: (context, state) {
            if (state is GetReturnedOrderSuccessState) {
              final onProcessingList = state.orders;
              if (onProcessingList.isEmpty) {
                return const OnProcessingEmptyOrders();
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  final order = onProcessingList[index];
                  return OnProcessingOrderWidget(
                    orderId: order.id.toString(),
                    itemCounts: order.itemCount,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: onProcessingList.length,
              );
            } else if (state is GetReturnedOrderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const OnProcessingEmptyOrders();
            }
          },
        ),
      ),
    );
  }
}
