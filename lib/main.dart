import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/constants/route_constant.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/widget/bread_crumb_notifier.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/provider/object_provider.dart';
import 'package:state_management_examples/theme/app_theme.dart';

void main() => runApp(const StateManagementApp());

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider ile birden fazla provider'a erişim sağlıyoruz.
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider ile BreadCrumbNotifier'a erişim sağlıyoruz.
        // Bu sayede BreadCrumbNotifier'da bulunan değişkenler ve metotlara erişim sağlayabiliriz.
        ChangeNotifierProvider(
          create: (context) => BreadCrumbNotifier(),
        ),
        // ChangeNotifierProvider ile ObjectProvider'a erişim sağlıyoruz.
        ChangeNotifierProvider(
          create: (context) => ObjectProvider(),
        ),
      ],
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
