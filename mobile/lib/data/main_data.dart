import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:new_one_v1/models/user_model.dart';

class MainData {
  final bodyIndex = ValueNotifier<int>(0);
  final stepIndex = ValueNotifier<int>(0);
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Contrller = TextEditingController();
  final firstNameContrller = TextEditingController();
  final lastNameContrller = TextEditingController();
  UserModel? theUser;
  Location location = Location();
  Future getPermission() async {
    final permission = await location.hasPermission();
    if (permission.name != 'Granted') {
      location.requestPermission();
    }
  }
}
