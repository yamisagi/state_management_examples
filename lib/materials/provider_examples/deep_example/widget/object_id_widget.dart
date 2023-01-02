import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/provider/object_provider.dart';

class ObjectIdWidget extends StatelessWidget {
  const ObjectIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ObjectProvider objectProvider = context.watch<ObjectProvider>();

    return Container(
      color: Colors.purple,
      child: Column(
        children: [
          const Text('Object ID'),
          Text(objectProvider.id),
        ],
      ),
    );
  }
}
