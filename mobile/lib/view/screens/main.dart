import 'package:flutter/material.dart';
import 'package:new_one_v1/configs/size_config.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/futures/auth/futures.dart';
import 'package:new_one_v1/models/user_model.dart';
import 'package:new_one_v1/view/screens/home.dart';
import 'package:new_one_v1/view/screens/log_in.dart';
import 'package:new_one_v1/view/screens/sing_up.dart';
import 'package:new_one_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> getLog() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('theUser');
    if (user != null) {
      mainData.theUser = UserModel.fromJson(user);
      return true;
    }
    return false;
  }

  final mainData = MainData();
  final futures = AuthFutures();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getLog();
    getIt.registerSingleton<MainData>(mainData, instanceName: 'mainData');
    getIt.registerSingleton<AuthFutures>(futures..init(),
        instanceName: 'futures');
    mainData.getPermission();
    futures.eventsListener();
  }

  Future? future;
  @override
  Widget build(BuildContext context) {
    SizeConfig.getSizes(context);
    return FutureBuilder(
      future: future,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            ),
          );
        }
        return !snap.data ? const HomeScreen() : const LogInScreen();
      },
    );
  }
}
