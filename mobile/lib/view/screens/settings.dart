import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenTitle(title: 'Setting'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: Colors.black,
                ),
              ),
              const MyPopupButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class MyPopupButton extends StatelessWidget {
  const MyPopupButton({super.key});
  // static final langData = getIt<LanguageData>(instanceName: 'langData');
  static final languages = [
    'Türkmençe',
    'Русский',
    'English',
  ];
  static final title = ValueNotifier<String>(languages.first);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      shadowColor: Colors.black,
      splashRadius: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      itemBuilder: (context) {
        return List.generate(
          languages.length,
          (index) => PopupMenuItem(
            onTap: () {
              title.value = languages[index];
            },
            height: 40.h,
            child: Text(
              languages[index],
              style: GoogleFonts.urbanist(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
      child: SizedBox(
        height: 45.h,
        // width: 90.w,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
                valueListenable: title,
                builder: (context, title, child) {
                  return Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                  );
                }),
            SizedBox(width: 23.w),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.sp,
              color: navBarIconsColor,
            )
          ],
        ),
      ),
    );
  }
}
