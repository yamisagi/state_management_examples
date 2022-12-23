import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/stateful_app/provider/mock_provider.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mockApi = MockProvider.of(context).mockApi;
    return Text(
      mockApi.dateTime ?? 'Tap to get date time',
      style: const TextStyle(fontSize: 20),
    );
  }
}
