import 'package:e_commerce_app/features/notifications/data/data_sources/firebase_notification_data_source.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseNotificationDataSource firebaseNotificationDataSource;

  NotificationRepositoryImpl({required this.firebaseNotificationDataSource});

  @override
  Future<void> sendNotification(NotificationEntity notification) async {
    await firebaseNotificationDataSource.sendNotification(notification);
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    final notifications = await firebaseNotificationDataSource.getNotifications();
    return notifications;
  }
}
