import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/view/add_bread_crumb_view.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/widget/bread_crumb_notifier.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/widget/bread_crumb_widget.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider Home'),
        ),
        body: Center(
          child: Column(
            children: [
              //* Consumer ile BreadCrumbNotifier'a erişim sağlıyoruz.
              Consumer<BreadCrumbNotifier>(
                builder: ((context, value, child) => BreadCrumbWidget(
                      breadCrumb: //! value ile BreadCrumbNotifier'a erişim sağlanabiliyor.
                          value.breadCrumbList,
                    )),
              ),
              // *** Bu Şekilde de kullanabiliriz. ***
              // BreadCrumbWidget(
              //   breadCrumb:
              //       Provider.of<BreadCrumbNotifier>(context).breadCrumbList,
              // ),
              TextButton(
                child: const Text('Add new bread crumb'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddBreadCrumbView(),
                      ));
                },
              ),
              TextButton(
                child: const Text('Clear bread crumb'),
                onPressed: () {
                  // context.read ile BreadCrumbNotifier'a erişim sağlıyoruz.
                  // Bu sayede BreadCrumbNotifier'da bulunan değişkenler ve metotlara erişim sağlayabiliriz.
                  // Provider.of ile de aynı işlemi yapabiliriz.
                  // Zaten kaynak kodunda da
                  // T read bize Provider.of<T>(this, listen: false) return ediyor.
                  // Callback'lerde read kullanmak daha performanslı ve daha güvenli.
                  // Default olarak listen: false olarak ayarlandığı için herhangi bir dinleme işlemi yapmıyor.
                  // Sadece snapshot alıyor.
                  context.read<BreadCrumbNotifier>().clearBreadCrumb();
                  // Provider.of(context).clearBreadCrumb();
                },
              ),
            ],
          ),
        ));
  }
}
