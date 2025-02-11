import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase({required this.repository});

  Future<List<NotificationEntity>> call() async {
    try {
      return await repository.getNotifications();
    } catch (e) {
      throw Exception('Failed to get notifications: $e');
    }
  }
}
