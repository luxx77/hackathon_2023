import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/futures/auth/futures.dart';
import 'package:new_one_v1/main.dart';

class SOSButton extends StatelessWidget {
  const SOSButton({super.key});
  static const firstColor = Color.fromRGBO(226, 71, 71, 1);
  static const secondColros = Color.fromRGBO(226, 71, 71, 0.4);
  static const lastColor = Color.fromRGBO(226, 71, 71, 0.2);
  static final futures = getIt<AuthFutures>(instanceName: 'futures');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 293.h,
      width: 293.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: lastColor,
      ),
      child: Container(
        height: 235.h,
        width: 235.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: secondColros,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9999.r),
          child: Material(
            color: firstColor,
            child: InkWell(
              onTap: () {
                futures.sentSos(context);
              },
              child: Container(
                height: 161.h,
                width: 161.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  'SOS',
                  style: GoogleFonts.urbanist(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
