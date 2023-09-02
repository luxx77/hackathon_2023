import 'package:flutter/material.dart';
import 'package:new_one_v1/models/instruction_model.dart';
import 'package:new_one_v1/view/widgets/instruction.dart';

class InstruckionsBuilder extends StatelessWidget {
  const InstruckionsBuilder({super.key});

  static final List<InstructionModel> models = [
    InstructionModel(
      title: 'Earthquake',
      imgPath: 'assets/images/tsunami.png',
      steps: [
        "Drop to the ground, take cover under a sturdy table or desk, and hold on until the shaking stops.",
        "Stay away from windows, outside doors, and walls.",
        "If you are in bed, stay there and cover your head with a pillow.",
        "If you are outdoors, stay in the open away from buildings, trees, and power lines.",
        "If you are in a car, stop and stay in the car until the shaking stops.",
        "After the shaking stops, check for injuries and damage.",
        "Be prepared for aftershocks.",
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: models.length,
        itemBuilder: (context, index) {
          return InstructionWidget(
            model: models[index],
          );
        },
      ),
    );
  }
}
