import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/model/bread_crumb_model.dart';

class BreadCrumbWidget extends StatelessWidget {
  const BreadCrumbWidget({super.key, required this.breadCrumb});
  final List<BreadCrumbModel> breadCrumb;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumb.map((e) {
        return Text(
          e.name,
          style: Theme.of(context)
              .textTheme
              .bodyText1 //
              ?.copyWith(
                color: e.isActive ? Colors.blue : Colors.black,
              ),
        );
      }).toList(),
    );
  }
}
