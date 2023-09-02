import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/main.dart';

class StepsSelection extends StatelessWidget {
  const StepsSelection({super.key, required this.length});
  final int length;
  static final mainData = getIt<MainData>(instanceName: 'mainData');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) {
            return ValueListenableBuilder(
              valueListenable: mainData.stepIndex,
              builder: (context, value, child) {
                return Container(
                  height: 10.h,
                  width: 10.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: value != index ? Colors.grey : mainColor,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
