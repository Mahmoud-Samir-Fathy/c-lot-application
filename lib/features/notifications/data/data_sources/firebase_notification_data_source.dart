import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/notifications/domain/entities/notification_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseNotificationDataSource {
  Future<void> sendNotification(NotificationEntity notification);
  Future<List<NotificationEntity>> getNotifications();
}

class FirebaseNotificationDataSourceImpl implements FirebaseNotificationDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> sendNotification(NotificationEntity notification) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'USER_NOT_LOGGED_IN',
          message: 'User must be logged in to send a notification.',
        );
      }

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('notification')
          .add(notification.toMap());
    } on FirebaseException catch (e) {
      throw Exception('Failed to send notification: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    try {
      final user=FirebaseAuth.instance.currentUser;
      final snapshot = await _firestore
          .collection('users')
          .doc(user!.uid)
          .collection('notification')
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return NotificationEntity.fromJason(data);
      }).toList();
    } on FirebaseException catch (e) {
      throw Exception('Failed to fetch notifications: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
