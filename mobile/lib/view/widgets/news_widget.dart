import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.model});
  final NewsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      // width: 390.w,
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 7.w),
      decoration: BoxDecoration(
        color: instructionWidgetColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.only(left: 16.w, top: 10.h, bottom: 10.h, right: 2.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              height: 100.h,
              width: 125.w,
              child: Image.asset(
                'assets/images/tsunami.png',
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  model.title,
                  maxLines: 2,
                  softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.urbanist(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                '$model.des',
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.urbanist(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
