import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/notifications/notification_controller.dart';
import 'package:jeropay/screens/notifications/notification_detail_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(NotificationController());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.unreadCount.value > 0
                  ? 'Notifications (${controller.unreadCount.value})'
                  : 'Notifications',
              style: kEncodeSansBold.copyWith(fontSize: 16),
            )),
        centerTitle: true,
        actions: [
          Obx(() => controller.unreadCount.value > 0
              ? TextButton(
                  onPressed: controller.markAllRead,
                  child: Text(
                    'Mark all read',
                    style: kEncodeSansSmall.copyWith(color: purple, fontSize: 12),
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.notifications_none, size: 60, color: Colors.grey),
                const SizedBox(height: 12),
                Text('No notifications yet',
                    style: kEncodeSansMedium.copyWith(color: kDarkGrey)),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => controller.fetch(),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: controller.notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = controller.notifications[index];
              return GestureDetector(
                onTap: () {
                controller.markRead(item.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationDetailScreen(notification: item),
                  ),
                );
              },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: item.isRead
                        ? Theme.of(context).cardColor
                        : const Color(0xff5f2e96).withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item.isRead
                          ? Colors.grey.withValues(alpha: 0.15)
                          : const Color(0xff5f2e96).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 2, right: 12),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item.isRead ? Colors.transparent : purple,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: kEncodeSansBold.copyWith(fontSize: 13),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.body,
                              style: kEncodeSansMedium.copyWith(
                                  fontSize: 12, color: kDarkGrey),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _formatDate(item.createdAt),
                              style: kEncodeSansSmall.copyWith(
                                  fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      return '${dt.day}/${dt.month}/${dt.year}  ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }
}
