import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/inheritednotifier_changenotifier/extensions/expand_equality.dart';
import 'package:state_management_examples/materials/inheritednotifier_changenotifier/provider/slider_data.dart';
import 'package:state_management_examples/materials/inheritednotifier_changenotifier/provider/slider_notifier.dart';

// SliderData'ya ulaşabilmek için genellikler global bir değişken tanımlanır.
final SliderData sliderData = SliderData();

class NotiferHomePage extends StatelessWidget {
  const NotiferHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier Home Page'),
      ),
      body: SliderInheritedNotifier(
        notifier: sliderData,
        // Burda builder kullanmamızın sebebi,
        // Notifier'ın değişmesi durumunda SliderInheritedNotifier widget'ı rebuild edilmesi.
        // Bu sayede SliderInheritedNotifier.of(context) çağrıldığında notifier'ın değeri güncellenmiş olur.
        // Eğer child olarak direkt Column widget'ı verilirse, notifier'ın değişmesi durumunda Column widget'ı rebuild edilmez.
        // Bu durumda SliderInheritedNotifier.of(context) çağrıldığında notifier'ın değeri güncellenmez.
        // Yani NotifierHomePage'in context'i oluşturulduğu zaman SliderInheritedNotifier daha ortaya çıkmamış olur.
        // Bu durumda SliderInheritedNotifier.of(context) çağrıldığında notifier'ın değeri null olur.

        child: Builder(builder: (context) {
          return Column(
            children: [
              Slider(
                value: SliderInheritedNotifier.of(context),
                onChanged: (newValue) {
                  log('newValue: $newValue');
                  sliderData.value = newValue;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Slider Value: ${SliderInheritedNotifier.of(context).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Row(
                children: [
                  Opacity(
                    opacity: SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  Opacity(
                    opacity: 1 - SliderInheritedNotifier.of(context),
                    child: Container(
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                ]
                    .expandEquality() //
                    .toList(),
              )
            ],
          );
        }),
      ),
    );
  }
}
