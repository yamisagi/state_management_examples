import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/inherited_model/enum/color_enum.dart';
import 'dart:developer' as devtools;

import 'package:state_management_examples/materials/inherited_model/widgets/available_color_widget.dart';

class ColorBoxWidget extends StatelessWidget {
  const ColorBoxWidget({
    super.key,
    required this.availableColor,
    required this.text,
  });
  final AvailableColor availableColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    switch (availableColor) {
      case AvailableColor.one:
        devtools.log('ColorBoxWidget 1 build');
        break;
      case AvailableColor.two:
        devtools.log('ColorBoxWidget 2 build');
        break;
    }
    final availableColorProvider =
        AvailableColorWidget.of(context, availableColor);

    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: availableColor == AvailableColor.one
              ? availableColorProvider!.availableColor1
              : availableColorProvider!.availableColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 200,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ));
  }
}
