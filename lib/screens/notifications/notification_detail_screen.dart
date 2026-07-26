import 'package:flutter/material.dart';
import 'package:jeropay/config/app_style.dart';
import 'package:jeropay/config/size_config.dart';
import 'package:jeropay/screens/notifications/notification_controller.dart';

class NotificationDetailScreen extends StatelessWidget {
  final NotificationItem notification;
  const NotificationDetailScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification', style: kEncodeSansBold.copyWith(fontSize: 16)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: notification.isRead
                        ? Colors.grey.withValues(alpha: 0.15)
                        : const Color(0xff5f2e96).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    notification.isRead ? 'Read' : 'Unread',
                    style: kEncodeSansSmall.copyWith(
                      fontSize: 11,
                      color: notification.isRead ? Colors.grey : const Color(0xff5f2e96),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  _formatDate(notification.createdAt),
                  style: kEncodeSansSmall.copyWith(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              notification.title,
              style: kEncodeSansBold.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 2.2,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.withValues(alpha: 0.2)),
            const SizedBox(height: 16),
            Text(
              notification.body,
              style: kEncodeSansMedium.copyWith(
                fontSize: SizeConfig.blockSizeVertical! * 1.8,
                height: 1.6,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white70
                    : const Color(0xff444444),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso).toLocal();
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}  '
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }
}
