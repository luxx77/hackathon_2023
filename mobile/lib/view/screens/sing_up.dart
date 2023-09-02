import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';
import 'package:new_one_v1/view/widgets/authWidges/do_auth.dart';
import 'package:new_one_v1/view/widgets/authWidges/fields.dart';
import 'package:new_one_v1/view/widgets/authWidges/or_line.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});
  static const List<String> titles = [
    'user name',
    'first name',
    'second name',
    'password',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const ScreenTitle(title: 'Sing up'),
          for (int i = 0; i < 4; i++) AuthFileds(title: titles[i]),
          SizedBox(height: 10.h),
          const DoAuthButton(forLogin: false, onTop: true),
          const OrLine(),
          const DoAuthButton(forLogin: true, onTop: false)
        ],
      ),
    );
  }
}
