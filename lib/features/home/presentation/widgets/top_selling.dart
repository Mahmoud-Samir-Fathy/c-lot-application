import'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/core/widgets/product_item.dart';
import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/product_top_selling_manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetProductCubit>()..getTopSellingProducts(),
      child: BlocConsumer<GetProductCubit, GetProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetProductSuccessState) {
            final product = state.products;
            return SizedBox(
              height: 400.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildProductItem(product[index],context),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 10.w,
                      ),
                  itemCount: product.length),
            );
          } else {
            return const Center(
              child: Text('Failed to load Products'),
            );
          }
        },
      ),
    );
  }
}

