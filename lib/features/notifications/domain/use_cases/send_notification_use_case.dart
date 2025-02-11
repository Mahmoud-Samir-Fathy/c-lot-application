import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';

class SendNotificationUseCase {
  final NotificationRepository repository;

  SendNotificationUseCase({required this.repository});

  Future<void> call(NotificationEntity notification) async {
    try {
      await repository.sendNotification(notification);
    } catch (e) {
      throw Exception('Failed to send notification: $e');
    }
  }
}
