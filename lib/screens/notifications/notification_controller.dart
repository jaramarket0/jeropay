import 'dart:convert';
import 'package:get/get.dart';
import 'package:jeropay/config/app_toast.dart';
import 'package:jeropay/services/api_service.dart';

class NotificationItem {
  final int id;
  final String title;
  final String body;
  bool isRead;
  final String createdAt;

  NotificationItem({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.createdAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) => NotificationItem(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        isRead: json['is_read'],
        createdAt: json['created_at'],
      );
}

class NotificationController extends GetxController {
  final ApiService _api = ApiService(const Duration(seconds: 30));

  RxList<NotificationItem> notifications = <NotificationItem>[].obs;
  RxInt unreadCount = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading.value = true;
    try {
      final response = await _api.fetchNotifications();
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final list = (body['data'] as List)
            .map((e) => NotificationItem.fromJson(e))
            .toList();
        notifications.assignAll(list);
        unreadCount.value = body['unread_count'] ?? 0;
      }
    } catch (e) {
      AppToast.error('Could not load notifications');
    } finally {
      isLoading.value = false;
    }
  }

  void markRead(int id) async {
    try {
      await _api.markNotificationRead(id);
      final item = notifications.firstWhereOrNull((n) => n.id == id);
      if (item != null && !item.isRead) {
        item.isRead = true;
        notifications.refresh();
        if (unreadCount.value > 0) unreadCount.value--;
      }
    } catch (_) {}
  }

  void markAllRead() async {
    try {
      await _api.markAllNotificationsRead();
      for (final n in notifications) {
        n.isRead = true;
      }
      notifications.refresh();
      unreadCount.value = 0;
      AppToast.success('All marked as read');
    } catch (_) {}
  }
}
