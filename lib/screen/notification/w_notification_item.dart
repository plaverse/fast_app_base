import 'package:fast_app_base/app.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';


class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notification;

  const NotificationItemWidget({super.key, required this.notification});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: !widget.notification.isRead? context.backgroundColor: context.appColors.unreadColor,
      child: Column(
        children: [
          Row(
            children: [Image.asset(widget.notification.type.iconPath)],
        ),
          widget.notification.description.text.make()
        ],
      ),
    );
  }
}
