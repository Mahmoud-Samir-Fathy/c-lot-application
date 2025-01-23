import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/orders/presentation/manager/states.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/empty_orders.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_widget.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocProvider(
        create: (context) => sl<OrderCubit>()..getOnProcessingOrder(),
        child: BlocBuilder<OrderCubit, OrdersStates>(
          builder: (context, state) {
            if (state is OrderSuccessState) {
              final onProcessingList = state.orders;
              if (onProcessingList.isEmpty) {
                return const EmptyOrders();
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  final order = onProcessingList[index];
                  return OrderWidget(
                    orderId: order.id.toString(),
                    itemCounts: order.itemCount,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemCount: onProcessingList.length,
              );
            } else if (state is OrderLoadingState) {
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
