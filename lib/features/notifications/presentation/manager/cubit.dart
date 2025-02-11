import 'package:e_commerce_app/features/notifications/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/use_cases/get_notification_use_case.dart';
import '../../domain/use_cases/send_notification_use_case.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final SendNotificationUseCase sendNotificationUseCase;
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationCubit(
      {required this.sendNotificationUseCase, required this.getNotificationsUseCase})
      : super(NotificationInitial());

  Future<void> sendNotification(NotificationEntity notification) async {
    emit(NotificationLoading());
    try {
      await sendNotificationUseCase(notification);
      final notifications = await getNotificationsUseCase();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError('Failed to send notification: $e'));
    }
  }

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await getNotificationsUseCase();
      emit(NotificationLoaded(notifications));
    } catch (e) {
      emit(NotificationError('Failed to fetch notifications: $e'));
    }
  }
}
