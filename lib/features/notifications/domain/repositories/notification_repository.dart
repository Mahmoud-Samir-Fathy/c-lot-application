import '../entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> sendNotification(NotificationEntity notification);
  Future<List<NotificationEntity>> getNotifications();
}
