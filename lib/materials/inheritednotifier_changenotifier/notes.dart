///? InheritedNotifier, InheritedWidget'ten türemiştir.
///* Bu widget, bir ChangeNotifier nesnesi ile ilişkili bir veri modeline sahiptir ve bu modeli tüm descendent widgetlarına geçirir.
///* Böylece, descendent widgetlar, modeli takip eden bir veri değişikliği olursa, otomatik olarak yeniden oluşturulur.

///? ChangeNotifier, "Listenable" adında bir class'tan türer.
///* Bu sınıf, bir veri modelini gösterir ve bu modelin değiştiğini bildirir.
///* Bu, bir veri modelinde bir değişiklik olduğunda, ChangeNotifier nesnesi tarafından tetiklenen bir "notifyListeners" metodunu çağırarak gerçekleştirilir.
///* Bu sayede, ChangeNotifier'ı takip eden widgetlar otomatik olarak yeniden oluşturulur.

///? InheritedNotifier, ChangeNotifier'ı takip eden widgetların bir modeli paylaşmasını ve bu modelin değişikliklerini izlemesini kolaylaştırmak için tasarlanmıştır.
///* Bu, aynı veri modeline erişim gereken widgetlar arasında veri paylaşımını kolaylaştırır ve tekrarlayan kod yazmayı azaltır.
///* Örnek olarak bir slider widget'ı ve bu slider'ın değerini gösteren bir text widget'ı düşünelim.
///* Bu iki widget, aynı veri modeline erişmelidir ve bu veri modeli, slider'ın değerini tutmalıdır.
///* Bu durumda, bu iki widget'ı bir widget ağacı altında toplayabiliriz.
///* Bu widget ağacı, bir ChangeNotifier nesnesi ile ilişkili bir veri modeline sahip bir InheritedNotifier widget'ı içerebilir.
///* Bu sayede, bu iki widget, bu veri modelini paylaşabilir ve bu veri modelinin değişikliklerini izleyebilir.
///* Ve InheritedNotifier Sınıfın'dan extend edilen bir widget, bizden bir notifier beklediği için,
///* Bu widget, bir ChangeNotifier nesnesi ile ilişkili bir veri modeline sahip olmalıdır.
///! ***************************************************************************************
///? Yaptığımız örnekte,
///* Biz de SliderData isimli bir ChangeNotifier nesnesi oluşturup, bu nesneyi InheritedNotifier widget'ına parametre olarak gönderdik.
///* Ve her value değişikliğinde, SliderData nesnesi notifyListeners() metodunu çağırarak, bu değişikliği izleyen widgetları yeniden oluşturdu.
///* Fakat burda dikkat etmemiz gereken bir nokta var ki bu da "context".
///* [NotifierHomePage]'in context'i oluşturulduğu zaman SliderInheritedNotifier daha ortaya çıkmamış olurdu.
///* Bu durumda SliderInheritedNotifier.of(context) çağrıldığında notifier'ın değeri null olurdu yani null check ile hep 0.0.