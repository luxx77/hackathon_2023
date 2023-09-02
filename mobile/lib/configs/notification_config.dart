import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/constants/names.dart';

class MyNotification {
  static final notik = AwesomeNotifications();
  static Future<void> initNotifications() async {
    notik.initialize(
        null,
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: notiChannelKey,
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: mainColor,
            ledColor: Colors.white,
            enableVibration: true,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group',
          )
        ],
        debug: true);
  }

  static int _id = 0;
  static void showNotification(String title, String body) {
    log('NOTIII');
    notik.createNotification(
      content: NotificationContent(
        id: _id,
        channelKey: notiChannelKey,
        title: title,
        body: body,
        actionType: ActionType.KeepOnTop,
        locked: true,
        criticalAlert: true,
      ),
    );
    _id++;
  }
}
