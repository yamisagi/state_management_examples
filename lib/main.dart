import 'package:flutter/material.dart';
import 'package:state_management_examples/constants/route_constant.dart';
import 'package:state_management_examples/theme/app_theme.dart';

void main() => runApp(const StateManagementApp());

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.darkTheme,
      title: 'State Management App',
      routes: RouteManager.routesList.asMap().map(
            (key, value) => MapEntry(
              value['route'],
              (context) => value['page'],
            ),
          ),
    );
  }
}
