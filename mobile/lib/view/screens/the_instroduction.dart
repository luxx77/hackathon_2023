import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/models/instruction_model.dart';
import 'package:new_one_v1/view/widgets/intr_steps.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';
import 'package:new_one_v1/view/widgets/steps_selection.dart';

class TheInstruction extends StatelessWidget {
  const TheInstruction({super.key, required this.model});
  final InstructionModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScreenTitle(title: model.title),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            height: 213.h,
            width: 275.w,
            child: Image.asset(
              model.imgPath,
              fit: BoxFit.contain,
            ),
          ),
          IntrSteps(steps: model.steps),
          StepsSelection(
            length: model.steps.length,
          )
        ],
      ),
    );
  }
}
