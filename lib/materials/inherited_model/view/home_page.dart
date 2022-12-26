import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/inherited_model/constants/product_colors.dart';
import 'package:state_management_examples/materials/inherited_model/enum/color_enum.dart';
import 'package:state_management_examples/materials/inherited_model/widgets/available_color_widget.dart';
import 'package:state_management_examples/materials/inherited_model/widgets/color_box.dart';

class InheritedModelHomePage extends StatefulWidget {
  const InheritedModelHomePage({Key? key}) : super(key: key);

  @override
  State<InheritedModelHomePage> createState() => _InheritedModelHomePageState();
}

class _InheritedModelHomePageState extends State<InheritedModelHomePage> {
  Color _color1 = Colors.red;
  Color _color2 = Colors.blue;
  String _box1Text = 'Color 1';
  String _box2Text = 'Color 2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedModel'),
      ),
      body: AvailableColorWidget(
        availableColor1: _color1,
        availableColor2: _color2,
        text1: _box1Text,
        text2: _box2Text,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: const Text('Change Color 1'),
                    onPressed: () {
                      setState(() {
                        _box1Text = 'I am Changed';
                        _box2Text = 'I am not Changed';
                        _color1 = ProductColors.colors.rand;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: const Text('Change Color 2'),
                    onPressed: () {
                      setState(() {
                        _box2Text = 'I am Changed';
                        _box1Text = 'I am not Changed';
                        _color2 = ProductColors.colors.rand;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ColorBoxWidget(
                      text: _box1Text,
                      availableColor: AvailableColor.one,
                    ),
                  ),
                  Expanded(
                    child: ColorBoxWidget(
                      text: _box2Text,
                      availableColor: AvailableColor.two,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
