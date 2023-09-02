import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';
import 'package:new_one_v1/view/widgets/sos_button.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ScreenTitle(title: 'SOS Call'),
        const SOSButton(),
        SizedBox(height: 20.sp),
      ],
    );
  }
}
