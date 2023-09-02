import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/models/instruction_model.dart';
import 'package:new_one_v1/view/screens/the_instroduction.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({super.key, required this.model});
  final InstructionModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheInstruction(model: model),
            ));
      },
      child: Container(
        height: 130.h,
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: instructionWidgetColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        alignment: Alignment.center,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            model.title,
            style: GoogleFonts.urbanist(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 102.h,
            width: 102.h,
            child: Image.asset(
              model.imgPath,
              fit: BoxFit.contain,
            ),
          )
        ]),
      ),
    );
  }
}
