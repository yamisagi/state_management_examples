import 'dart:developer' as devtools;

import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/inherited_model/enum/color_enum.dart';

// InheritedModel bize bir widget'ın bir alt widget'ı tarafından kullanılan bir modeli güncellemek için bir yol sağlar.

class AvailableColorWidget extends InheritedModel<AvailableColor> {
  final Color availableColor1;
  final Color availableColor2;
  final String text1;
  final String text2;

  const AvailableColorWidget({
    Key? key,
    required this.availableColor1,
    required this.availableColor2,
    required this.text1,
    required this.text2,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  // Descendant'larımızdan herhangi biri widget'ı güncellemek istediğinde ilk olarak bu method çalışır.
  // Eğer bu method true dönerse updateShouldNotifyDependent methodu çalışır.

  @override
  bool updateShouldNotify(covariant AvailableColorWidget oldWidget) {
    devtools.log('updateShouldNotify');
    return availableColor1 != oldWidget.availableColor1 ||
        availableColor2 != oldWidget.availableColor2 ||
        text1 != oldWidget.text1 ||
        text2 != oldWidget.text2;
  }

  // Bu methodda ise updateShouldNotify methodu true döndürdüğünde çalışır.
  // updateShouldNotifyDependent methodu ile updateShouldNotify methodu arasındaki fark şudur:
  // updateShouldNotify methodu widget'ın tüm alt widget'ları tarafından kullanılan bir modeli güncellemek istediğinde çalışır.
  // updateShouldNotifyDependent methodu ise widget'ın sadece belirli bir alt widget'ı tarafından kullanılan bir modeli güncellemek istediğinde çalışır.
  // Bu methodda dependencies parametresi ile hangi alt widget'ın modelini güncellemek istediğini belirtiyoruz.
  // Yani bu durumda eğer AvailableColor.one modelini güncellemek istiyorsak dependencies parametresine AvailableColor.one gönderiyoruz.
  // Eğer AvailableColor.two modelini güncellemek istiyorsak dependencies parametresine AvailableColor.two gönderiyoruz.
  // Ve bu methodda da eğer dependencies parametresindeki model güncellenmişse true döndürüyoruz.
  // Bu sayede Flutter bizim sadece belirli bir alt widget'ımızın modelini güncellemesini anlar.

  @override
  bool updateShouldNotifyDependent(
    covariant AvailableColorWidget oldWidget,
    Set<AvailableColor> dependencies,
  ) {
    devtools.log('updateShouldNotifyDependent');
    if (dependencies.contains(AvailableColor.one) &&
        availableColor1 != oldWidget.availableColor1 ) return true;
    if (dependencies.contains(AvailableColor.two) &&
        availableColor2 != oldWidget.availableColor2) return true;
    return false;
  }

  // InheritedModel'de InheritedWidget'ten farklı olarak of methodunda dependOnInheritedWidgetOfExactType metodunu kullanmıyoruz.
  // Bunun yerine inheritFrom methodunu kullanıyoruz.

  static AvailableColorWidget? of(BuildContext context, AvailableColor aspect) {
    return InheritedModel.inheritFrom(
      context,
      // Aspect bizden bir Object bekliyor. Bu yüzden aspect'e istenilen type gönderilebilir.
      aspect: aspect,
    );
  }
}
