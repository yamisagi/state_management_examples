import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/objects/cheap_object.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/provider/object_provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// [context.select] ile [ObjectProvider] içerisindeki [cheapObject] değişkenine erişiyoruz.
    /// Bu sayede [cheapObject] değişkeninin değişmesi durumunda sadece [CheapWidget] rebuild edilecek.
    CheapObject cheapObjectProvider =
        context.select<ObjectProvider, CheapObject>(
      (value) => value.cheapObject,
    );

    /// [context.watch] ile [ObjectProvider] içerisindeki [cheapObjectColor] değişkenine erişiyoruz.
    /// Bu sayede [cheapObjectColor] değişkeninin değişmesi durumunda sadece [CheapWidget] rebuild edilecek.
    ObjectProvider objectProvider = context.watch<ObjectProvider>();

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      color: objectProvider.cheapObjectColor,
      child: Column(
        children: [
          const Text('Cheap Widget'),
          Text(cheapObjectProvider.lastUpdated)
        ],
      ),
    );
  }
}
