import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/model/bread_crumb_model.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/widget/bread_crumb_notifier.dart';

class AddBreadCrumbView extends StatefulWidget {
  const AddBreadCrumbView({super.key});

  @override
  State<AddBreadCrumbView> createState() => _AddBreadCrumbViewState();
}

class _AddBreadCrumbViewState extends State<AddBreadCrumbView> {
  late final TextEditingController _breadCrumbController;

  @override
  void initState() {
    super.initState();
    _breadCrumbController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _breadCrumbController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bread Crumb'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _breadCrumbController,
                decoration: const InputDecoration(
                  hintText: 'Add new bread crumb',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Provider'imiz main levelde olduğu için context bulunan her yerden erişilebilir.
                context
                    .read<BreadCrumbNotifier>()
                    .addBreadCrumb(BreadCrumbModel(
                      isActive: false,
                      title: _breadCrumbController.text,
                    ));

                // Pop

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
