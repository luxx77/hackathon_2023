import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/configs/size_config.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.padTop),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w800,
          fontSize: 32.sp,
        ),
      ),
    );
  }
}
