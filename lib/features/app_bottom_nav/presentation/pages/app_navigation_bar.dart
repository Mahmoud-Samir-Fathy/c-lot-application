import 'package:e_commerce_app/core/utilis/app_colors.dart';
import 'package:e_commerce_app/features/app_bottom_nav/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/app_bottom_nav/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.background,
              unselectedItemColor: AppColors.searchColor,
              selectedItemColor: AppColors.primary,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: cubit.iconList.map((icon) {
                return BottomNavigationBarItem(
                  icon: Icon(icon),
                  label: '',
                );
              }).toList(),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
