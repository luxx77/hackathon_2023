import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/futures/auth/futures.dart';
import 'package:new_one_v1/main.dart';
import 'package:new_one_v1/models/user_model.dart';
import 'package:new_one_v1/view/screens/log_in.dart';
import 'package:new_one_v1/view/screens/sing_up.dart';

class DoAuthButton extends StatelessWidget {
  const DoAuthButton({
    super.key,
    required this.forLogin,
    required this.onTop,
  });
  final bool forLogin;
  final bool onTop;
  static final futures = getIt<AuthFutures>(instanceName: 'futures');
  static final mainData = getIt<MainData>(instanceName: 'futures');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Material(
          color: onTop ? mainColor : null,
          child: InkWell(
            onTap: () {
              if (!onTop) {
                Navigator.pushReplacement(context, CupertinoPageRoute(
                  builder: (context) {
                    if (forLogin) {
                      return const LogInScreen();
                    }
                    return const SingUpScreen();
                  },
                ));
                return;
              }
              if (forLogin) {
                return;
              }
              // final user = UserModel(firstName: , id: id, lastName: lastName, password: password, userName: userName)
              futures.singUp();
            },
            child: Container(
              width: 300.w,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border:
                    onTop ? null : Border.all(color: doAuthColor, width: 2.sp),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                forLogin ? 'Log in' : 'Sing up',
                style: GoogleFonts.urbanist(
                  fontSize: 20.sp,
                  color: onTop ? Colors.white : doAuthColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
