import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/provider/object_provider.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/widget/cheap_widget.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/widget/expensive_widget.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/widget/object_id_widget.dart';

class TimeHome extends StatelessWidget {
  const TimeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Home'),
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Expanded(child: CheapWidget()),
              Expanded(child: ExpensiveWidget()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(child: ObjectIdWidget()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => context.read<ObjectProvider>().start(),
                    child: const Text('Start')),
              ),
              ElevatedButton(
                  onPressed: () => context.read<ObjectProvider>().stop(),
                  child: const Text('Stop')),
            ],
          )
        ],
      ),
    );
  }
}
