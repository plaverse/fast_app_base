import 'package:fast_app_base/screen/notification/notifications_dummy.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(slivers: [
        const SliverAppBar(
          title: Text("알림"),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) =>
              NotificationItemWidget(notification: notificationDummies[index]),
          childCount: notificationDummies.length,
        )),
      ],
     ),
    );
  }
}
