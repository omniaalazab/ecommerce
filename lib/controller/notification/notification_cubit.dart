import 'package:ecommerce/controller/notification/notification_state.dart';
import 'package:ecommerce/model/notification_item.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState(notificationModel: []));

  void initialize() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notifications =
            List<NotificationModel>.from(state.notificationModel);
        notifications.add(
          NotificationModel(
            title: message.notification!.title ?? 'No Title',
            body: message.notification!.body ?? 'No Body',
          ),
        );
        emit(NotificationState(notificationModel: notifications));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        final notifications =
            List<NotificationModel>.from(state.notificationModel);
        notifications.add(
          NotificationModel(
            title: message.notification!.title ?? 'No Title',
            body: message.notification!.body ?? 'No Body',
          ),
        );
        emit(NotificationState(notificationModel: notifications));
      }
    });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   // Handle notification tap
    // });
    //}
  }
}
