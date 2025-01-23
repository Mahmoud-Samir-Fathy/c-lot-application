import 'package:e_commerce_app/features/app_bottom_nav/presentation/manager/states.dart';
import 'package:e_commerce_app/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_app/features/notifications/presentation/pages/notification_page.dart';
import 'package:e_commerce_app/features/orders/presentation/widgets/order_by_status.dart';
import 'package:e_commerce_app/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  var iconList = [
    Icons.home,
    Icons.notifications,
    Icons.archive,
    Icons.settings
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavIndex());
  }

  List<Widget> screens = [
    const HomePage(),
    const NotificationPage(),
     OrdersScreen(),
    const SettingsPage(),
  ];
}
