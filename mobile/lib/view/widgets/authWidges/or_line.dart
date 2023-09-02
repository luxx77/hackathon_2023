import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 46.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 134.w,
            height: 2.h,
            color: doAuthColor,
          ),
          Text(
            'or',
            style: GoogleFonts.urbanist(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: doAuthColor,
            ),
          ),
          Container(
            width: 134.w,
            height: 2.h,
            color: doAuthColor,
          )
        ],
      ),
    );
  }
}
