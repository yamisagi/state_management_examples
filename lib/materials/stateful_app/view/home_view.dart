import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/stateful_app/provider/mock_provider.dart';
import 'package:state_management_examples/materials/stateful_app/widget/datetime_widget.dart';

// Aşağıda yaptığımız işlemde, IngheritedWidget'e bağımlı Stateful widget'in içindeki state'ini güncellemek istediğimiz widgetler için,
// Bir key veriyoruz ve her key'in değeri değiştiğinde, rebuild edilmesini sağlıyoruz.
// Bu sayede InheritedWidget'in içindeki updateShouldNotify tetiklenir ve oldWidget newWidget ile değiştirilir.

class StatefulHome extends StatefulWidget {
  const StatefulHome({Key? key}) : super(key: key);

  @override
  State<StatefulHome> createState() => _StatefulHomeState();
}

class _StatefulHomeState extends State<StatefulHome> {
  ValueKey key = const ValueKey<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text(MockProvider.of(context).mockApi.dateTime ?? 'Stateful App'),
        ),
        body: GestureDetector(
          onTap: () async {
            final api = MockProvider.of(context).mockApi;
            final dateTime = await api.getTime();
            setState(() {
              key = ValueKey<String?>(dateTime);
            });
          },
          child: SizedBox.expand(
            child: Center(
              child: DateTimeWidget(
                key: key,
              ),
            ),
          ),
        ));
  }
}
