import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/constants/route_constant.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/widget/bread_crumb_notifier.dart';
import 'package:state_management_examples/theme/app_theme.dart';

void main() => runApp(const StateManagementApp());

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider ile BreadCrumbNotifier'a erişim sağlıyoruz.
    // Bu sayede BreadCrumbNotifier'da bulunan değişkenler ve metotlara erişim sağlayabiliriz.
    return ChangeNotifierProvider(
      create: (__) => BreadCrumbNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ProductTheme.darkTheme,
        title: 'State Management App',
        routes: RouteManager.routesList.asMap().map(
              (key, value) => MapEntry(
                value['route'],
                (context) => value['page'],
              ),
            ),
      ),
    );
  }
}
