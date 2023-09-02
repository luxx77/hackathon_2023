import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/configs/my_scroll_behavior.dart';
import 'package:get_it/get_it.dart';
import 'package:new_one_v1/configs/notification_config.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/constants/names.dart';
import 'package:new_one_v1/view/screens/main.dart';
import 'package:web_socket_client/web_socket_client.dart';

void main() {
  MyNotification.initNotifications();
  runApp(const MyApp());
}

GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        builder: (context, child) =>
            ScrollConfiguration(behavior: MyBehavior(), child: child!),
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    super.initState();
    // socket = WebSocket(Uri.parse('ws://10.20.110.118:7777/ws/notification/'));
    // some();
  }

  WebSocket? socket;
  void suu() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Simple Notification',
        body: 'Simple body',
        actionType: ActionType.SilentAction,
      ),
    );
  }

  // void some() {
  //   log(socket!.connection.state.toString());
  //   socket!.messages.listen(
  //     (event) {
  //       log('message');
  //       log(event);
  //     },
  //     onDone: () {
  //       log('done');
  //     },
  //   );
  // }

  String textik = 'nothing yet';
  // final dio = Dio();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                MyNotification.showNotification('title', ' body');
              },
              child: Text(
                textik,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
