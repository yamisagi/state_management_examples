///? Flutter'da InheritedWidget verileri tutan ve bu verilerin widget ağacındaki tüm child'leri tarafından kalıtılmasına izin veren özel bir widget türüdür.
///? Bu widget türü genellikle widget ağacında doğrudan ilişkisi olmayan widget'lar arasında veri paylaşımı için kullanılır.

///* Bir InheritedWidget, bir değer veya veri parçasını sarmalar ve bu veriyi BuildContext aracılığıyla child'lerine sağlar.
///* BuildContext widget ağacı boyunca widget'lar oluşturulurken aşağı doğru geçirilir
///* Ve InheritedWidget'dan veriye erişmek için kullanılabilir.

///* Bir InheritedWidget güncellendiğinde,
///* Bu widget'a bağımlı olan (yani bu widget'a bağımlı olan) widget'ları otomatik olarak bildirir 
///* Ve bu sayede güncellenen verilerle tekrar oluşturulabilirler.
///* Bu, InheritedWidget'ın veri değişikliklerini etkili bir şekilde widget ağacı içinde yaymasına izin verir.

/// ?Flutter'ta dependOnInheritedWidgetOfExactType metodu, widget ağacında yer alan bir türden InheritedWidget'a bağımlı olan bir StatefulWidget'ı belirtmenize yardımcı olur.

///* InheritedWidget verileri tutan ve bu verilerin widget ağacındaki tüm child'leri tarafından kalıtılmasına izin veren özel bir widget türüdür.
///* Bir InheritedWidget güncellendiğinde,
///* Bu widget'a bağımlı olan (yani bu widget'a bağımlı olan) widget'ları otomatik olarak bildirir ve bu sayede güncellenen verilerle tekrar oluşturulabilirler.

///* dependOnInheritedWidgetOfExactType, widget ağacında yer alan belirli bir türden InheritedWidget'a bağımlı olan bir StatefulWidget'ı belirtmenizi sağlar.
///* InheritedWidget güncellendiğinde, StatefulWidget güncellenen verilerle tekrar oluşturulur.