import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:new_one_v1/configs/notification_config.dart';
import 'package:new_one_v1/constants/urls.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/main.dart';
import 'package:new_one_v1/models/news_model.dart';
import 'package:new_one_v1/models/user_model.dart';
import 'package:new_one_v1/view/screens/news.dart';

class AuthFutures {
  final dio = Dio();
  MainData? mainData;
  void init() {
    mainData = getIt<MainData>(instanceName: 'mainData');
  }

  List<NewsModel>? news;

  Future<String> singUp() async {
    log('singUp ing');
    final firstName = mainData!.firstNameContrller.text;
    final lastName = mainData!.lastNameContrller.text;
    final passWord = mainData!.passwordController.text;
    final passWord2 = mainData!.password2Contrller.text;
    final userName = mainData!.userNameController.text;
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        passWord.isEmpty ||
        userName.isEmpty) {
      return 'fill in all fields';
    }
    if (passWord2 != passWord) {
      return 'passwords do not match';
    }
    final user = UserModel(
      firstName: firstName,
      id: 2,
      lastName: lastName,
      password: passWord,
      userName: userName,
    );
    final model = UserModel.toMap(user);
    model['password2'] = passWord2;
    model.remove('id');
    log(model.toString());
    final data = await dio.post('$mainUrl$singUpUrl',
        data: model,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    log(data.statusMessage.toString());
    return '';
  }

  Future<LocationData?> getLocation() async {
    final location = mainData!.location;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    log(_serviceEnabled.toString());
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _locationData = await location.getLocation().then(
      (value) {
        log('message');
        return value;
      },
    );
    return _locationData;
  }

  Future getNews() async {
    try {
      final data = await dio.get('$mainUrl$newsUrl');
      log(data.data.toString());
      final newss = data.data;
      news = List.generate(
        newss.length,
        (index) => NewsModel.fromMap(
          newss[index],
        ),
      );
      NewsScreen.notifier.value = !NewsScreen.notifier.value;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future sentSos(BuildContext context) async {
    bool sent = true;
    bool pop = true;
    final seconds = ValueNotifier<int>(5);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: seconds,
          builder: (context, value, child) {
            return Container(
              height: 60.h,
              color: Colors.transparent,
              margin: EdgeInsets.only(bottom: 76.h),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 25.w,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SOS sent',
                        style: GoogleFonts.urbanist(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              sent = false;
                              pop = false;
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancle',
                              style: GoogleFonts.urbanist(
                                decorationThickness: 2.sp,
                                fontSize: 23.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: 65.w,
                            height: 2.5.h,
                            color: Colors.white,
                          )
                        ],
                      )
                    ]),
              ),
            );
          },
        );
      },
    );
    for (int i = 0; i < 3; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        seconds.value--;
      });
    }
    if (sent && pop) {
      Navigator.pop(context);
    }
    // double.parse('source');
    mainData!.bodyIndex.value = 1;

    final location = await getLocation();
    if (location != null) {
      final model = {
        'user': 7,
        'location': '${location.latitude},${location.longitude}',
        'created_at': DateTime.now().toString(),
      };
      mainData!.bodyIndex.value = 1;
      try {
        final data = await dio.post(
          '$mainUrl$sosUrl',
          data: model,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );
        // log(data.data.toString());
        log(data.statusMessage.toString());
      } catch (e) {
        log('$e');
      }
    }
  }

  Map lastEvent = {
    'id': 9999,
  };
  Future eventsListener() async {
    await Future.delayed(const Duration(seconds: 2));
    log('event');
    try {
      final data = await dio.get('$mainUrl$eventsUrl');
      log('${data.data} some');
      if (lastEvent['id'] == data.data['id']) {
        eventsListener();
        return;
      }
      log('show');
      MyNotification.showNotification(
        data.data['event_type'],
        data.data['text'],
      );
      lastEvent = data.data;
    } catch (e) {
      log(e.toString());
    }
    eventsListener();
  }
}
