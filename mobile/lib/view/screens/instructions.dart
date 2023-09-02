import 'package:flutter/material.dart';
import 'package:new_one_v1/constants/names.dart';
import 'package:new_one_v1/constants/pathes.dart';
import 'package:new_one_v1/view/widgets/screens_title.dart';
import 'package:new_one_v1/view/widgets/builders/instructions_builder.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ScreenTitle(
          title: instructionsText,
        ),
        InstruckionsBuilder()
      ],
    );
  }
}
