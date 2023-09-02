import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/constants/pathes.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';
import 'package:new_one_v1/view/widgets/authWidges/do_auth.dart';
import 'package:new_one_v1/view/widgets/authWidges/fields.dart';
import 'package:new_one_v1/view/widgets/authWidges/or_line.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const ScreenTitle(title: 'Log in'),
            SizedBox(
              width: double.infinity,
              height: 200.h,
              child: Image.asset(authImg, fit: BoxFit.fitHeight),
            ),
            for (int i = 0; i < 2; i++)
              AuthFileds(
                title: i != 0 ? 'password' : 'user name',
              ),
            SizedBox(height: 19.h),
            const DoAuthButton(forLogin: true, onTop: true),
            const OrLine(),
            const DoAuthButton(forLogin: false, onTop: false)
          ],
        ));
  }
}
