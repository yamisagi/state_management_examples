 // ********* ValueNotifier ********* //
 
 ///* ValueNotifier, Flutter'da bir widget sınıfıdır. Bu sınıf, değişken değerleri göstermek için kullanılır ve bu değerler değiştiğinde, ValueNotifier öğesi otomatik olarak yenilenir. 
 ///* Bu, ValueNotifier öğesi içinde tutulan değerlerin güncel olmasını sağlar.
 
 ///? ValueNotifier, bir "değiştirici" sınıfıdır ve bu nedenle kendi değerini değiştirebilir.
 ///? Bu, ValueNotifier öğesi tarafından gösterilen değerlerin dinamik olarak değiştirilebilmesine olanak sağlar.
 ///? Örneğin, bir sayaç uygulamasında sayaç değerini artırmak için ValueNotifier sınıfını kullanabilirsiniz.
 
 ///* ValueNotifier sınıfı, ChangeNotifier sınıfından türemiştir ve bu nedenle ChangeNotifier sınıfının özelliklerini de kullanır.
 ///? Örneğin, ValueNotifier sınıfı da "notifyListeners()" yöntemini kullanarak dinleyicilere değişiklikleri bildirir.
 ///
 /// Örnek olarak ValueNotifier sınıfını incelediğimizde, ValueNotifier sınıfının Constructor'unda "value" adlı bir değişkeni olduğunu görürüz.
 /// Bu değişken, ValueNotifier sınıfının gösterdiği değeri tutar. 
 /// Sınıfı daha iyi anlamak için, ValueNotifier sınıfının Constructor'ını inceleyelim:
  
  /*                                   ValueNotifier(this._value);
                                       @override
                                        T get value => _value;
                                        T _value;
                                        set value(T newValue) {
                                          if (_value == newValue) {
                                            return;
                                          }
                                        _value = newValue;
                                        notifyListeners();
                                      }  
  */



  /// Burada bir setter ile eğer yeni değer eski değer ile eşit değilse, yeni değeri atar ve dinleyicilere notifyListeners() yöntemi ile bildirir.
  ///! Önemli olan kısım ise ' == ' operatörü ile değerlerin eşit olup olmadığını kontrol etmesidir.
  ///! Bu durumda eğer biz kendimiz bir sınıf oluşturursak, equality konusuna dikkat etmemiz gerekir .



 /// ********* ValueListenableBuilder ********* ///
  
 ///* ValueListenableBuilder, Flutter'da bir widget sınıfıdır ve ValueNotifier gibi, değişken değerleri göstermek için kullanılır. 
 ///* Ancak, ValueListenableBuilder widget'ı, değerler değiştiğinde otomatik olarak yenilenen bir widget döndürür
 ///* Ve bu sayede, ValueListenableBuilder widget'ı içinde tutulan değerlerin güncel olmasını sağlar.

 ///* ValueListenableBuilder widget'ı, değişken değerleri göstermek için kullanıldığında, 
 ///* Bir "valuListenable" ve bir "builder" widget'ını birleştirir. 
 ///* Değer dinleyicisi, ValueListenable öğesi tarafından sağlanır örneğin ValueNotifier gibi ve bu öğe, değerler değiştiğinde bir callback çağırır.
 ///* Değer inşa edici widget ise, bu callback çağırıldığında, güncellenen değerleri kullanarak yeni bir widget oluşturur.