import 'package:e_commerce_app/dependency_injection.dart';
import 'package:e_commerce_app/features/notifications/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/notifications/presentation/manager/states.dart';
import 'package:e_commerce_app/features/notifications/presentation/widgets/empty_notifications.dart';
import 'package:e_commerce_app/features/notifications/presentation/widgets/notification_widget.dart';
import 'package:e_commerce_app/shared_widgets/app_bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        title: Text('Notifications'),
      ),
      body: BlocProvider(
        create: (context) => sl<NotificationCubit>()..fetchNotifications(),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if(state is NotificationLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if (state is NotificationLoaded) {
              final notificationList=state.notifications;
              if(notificationList.isEmpty){
                return const EmptyNotifications();
              } else {
                return ListView.separated(
                    itemBuilder: (context, index) =>  NotificationWidget(
                      notification: notificationList[index],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 10.h,
                        ),
                    itemCount: notificationList.length);
              }
            }
            return const EmptyNotifications();

          },
        ),
      ),
    );
  }
}
