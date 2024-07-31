import 'package:ecommerce/helper/color_helper.dart';
import 'package:ecommerce/helper/text_style_helper.dart';
import 'package:ecommerce/model/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationDetailPage extends StatelessWidget {
  final NotificationModel notification;

  const NotificationDetailPage({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: ColorHelper.darkpurple,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        backgroundColor: ColorHelper.darkpurple,
        title: Text(
          '${notification.title}',
          style: TextStyleHelper.textStylefontSize20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '${notification.body}',
          style: TextStyleHelper.textStylefontSize18,
        ),
      ),
    );
  }
}
