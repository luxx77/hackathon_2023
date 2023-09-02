import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_one_v1/constants/colors.dart';
import 'package:new_one_v1/data/main_data.dart';
import 'package:new_one_v1/main.dart';

class IntrSteps extends StatefulWidget {
  const IntrSteps({super.key, required this.steps});
  final List<String> steps;
  @override
  State<IntrSteps> createState() => _IntrStepsState();
}

class _IntrStepsState extends State<IntrSteps>
    with SingleTickerProviderStateMixin {
  final mainData = getIt<MainData>(instanceName: 'mainData');

  TabController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: widget.steps.length, vsync: this);
    controller!.addListener(() {
      mainData.stepIndex.value = controller!.index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mainData.stepIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    final steps = widget.steps;
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: List.generate(widget.steps.length, (index) {
          return Column(
            children: [
              Text(
                'Step${index + 1}',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w800,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                steps[index],
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500,
                  color: stepsColor,
                  fontSize: 20.sp,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
