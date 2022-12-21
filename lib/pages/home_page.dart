import 'package:flutter/material.dart';
import 'package:state_management_examples/constants/route_constant.dart';
import 'package:state_management_examples/widgets/route_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Examples'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: RouteManager.routesList.length,
        itemBuilder: (context, index) {
          final route = RouteManager.routesList[index];
          // To prevent show the first item <HomePage>
          if (index == 0) return const SizedBox();
          return RouterButton(
            title: route['title'],
            routeName: route['route'],
            subtitle: route['subtitle'],
          );
        },
      ),
    );
  }
}
