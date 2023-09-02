import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/constants/pathes.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/main.dart';

import '../../constants/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});
  static const List<String> icons = [
    sosIcon,
    instrucktionIcon,
    networkIcon,
    settingsIcon,
  ];
  static final mainData = getIt<MainData>(instanceName: 'mainData');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      padding: EdgeInsets.symmetric(horizontal: 38.w),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 4; i++)
            ValueListenableBuilder(
                valueListenable: mainData.bodyIndex,
                builder: (context, bodyIndex, child) {
                  return GestureDetector(
                    onTap: () {
                      mainData.bodyIndex.value = i;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      padding: bodyIndex != i
                          ? EdgeInsets.all(5.sp)
                          : EdgeInsets.zero,
                      // alignment: Alignment.center,
                      width: 40.sp,
                      height: 40.sp,
                      // color: Colors.red,
                      child: ImageIcon(
                        AssetImage(
                          icons[i],
                        ),
                        color: bodyIndex != i ? navBarIconsColor : Colors.white,
                      ),
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
