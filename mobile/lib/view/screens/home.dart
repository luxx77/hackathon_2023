import 'package:flutter/material.dart';
import 'package:new_one_v1/main.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/view/screens/instructions.dart';
import 'package:new_one_v1/view/screens/news.dart';
import 'package:new_one_v1/view/screens/settings.dart';
import 'package:new_one_v1/view/screens/sos.dart';
import 'package:new_one_v1/view/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [
    SOSScreen(),
    InstructionsScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];
  final mainData = getIt<MainData>(instanceName: 'mainData');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: mainData.bodyIndex,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
