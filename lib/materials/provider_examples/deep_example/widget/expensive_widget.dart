import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/objects/expensive_object.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/provider/object_provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [context.select] ile [ObjectProvider] içerisindeki [expensiveObject] değişkenine erişiyoruz.
    /// Bu sayede [expensiveObject] değişkeninin değişmesi durumunda sadece [ExpensiveWidget] rebuild edilecek.
    ExpensiveObject expensiveObjectProvider =
        context.select<ObjectProvider, ExpensiveObject>(
      (value) => value.expensiveObject,
    );

    /// [context.watch] ile [ObjectProvider] içerisindeki [expensiveObjectColor] değişkenine erişiyoruz.
    /// Bu sayede [expensiveObjectColor] değişkeninin değişmesi durumunda sadece [ExpensiveWidget] rebuild edilecek.
    ObjectProvider objectProvider = context.watch<ObjectProvider>();
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: objectProvider.expensiveObjectColor,
      child: Column(
        children: [
          const Text('Expensive Widget'),
          Text(expensiveObjectProvider.lastUpdated)
        ],
      ),
    );
  }
}
