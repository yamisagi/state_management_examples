import 'package:flutter/material.dart';

extension ExpandEquality on Iterable<Widget> {
  Iterable<Widget> expandEquality() => map((widget) => Expanded(child: widget));
}
