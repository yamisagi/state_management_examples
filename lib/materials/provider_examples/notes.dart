///? Flutter'da Provider, uygulamalarda veri yönetimini kolaylaştıran bir kütüphanedir.
///* Bu kütüphane, verilerinizi ve bu verilere erişen widgetlerinizi bir arada yönetmenizi sağlar.
///* Örneğin, bir veritabanı veya bir REST API gibi bir veri kaynağından verileri alıp,
///* Bu verileri kullanarak bir widget oluşturursunuz.
///* Bu widget, verileri göstermek için kullanılır ve bu veriler değiştiğinde widgetin state'i güncelleştirir.

///* Provider, bu veri yönetimini kolaylaştırmak için çeşitli sınıflar sağlar.
///* Örneğin, ChangeNotifierProvider sınıfı, bir ChangeNotifier sınıfını kullanarak verilerin değiştiğini bildirebilir.
///* Bu sayede, veriler değiştiğinde widgetlerin görüntülenmesi güncelleştirilebilir.

///? Context üzerinden eriştiğimiz Provider'ın methodları:
///* read: Provider'ın içindeki verileri okumak için kullanılır.
///? Örneğin, Provider içindeki bir veriyi okumak için:
///? Provider.of<ProviderClass>(context, listen: false).veri;
///? listen: false parametresi, verilerin değiştiğinde widgetin state'ini güncellemesini engeller.
///? Genellikle, CallBack fonksiyonlarında kullanılır.
///* watch: Provider'ın içindeki verileri izlemek için kullanılır.
///? Örneğin, Provider içindeki bir veriyi izlemek için:
///? Provider.of<ProviderClass>(context).veri;
///? listen: true parametresi, verilerin değiştiğinde widgetin state'ini güncellemesini sağlar.
///? listen: true parametresi, default olarak true'dur.
///* select: Provider'ın içindeki verileri seçmek için kullanılır. 
///? Örneğin, Provider içindeki bir veriyi seçmek için:
///? Provider.of<ProviderClass>(context).select((value) => value.veri);
///? *****
///* Bir diğer yöntem olarak, Consumer sınıfı da kullanılabilir.
/// 
/// Örneğin, Consumer sınıfı ile Provider içindeki bir veriyi okumak için:
///! Consumer<ProviderClass>(
///!  builder: (context, value, child) => Text(value.veri),
///! );
/// *****  
///? Özetle Consumer sınıfı,
///* Consumer, bir Provider sınıfından veri almak ve bu verileri kullanarak bir widget oluşturmak için kullanılır.
///* Consumer widgeti, bir Provider sınıfının bir örneğine erişir ve bu örnekten verileri alır.
///* Daha sonra, bu verileri kullanarak bir widget oluşturur ve bu widgeti görüntüler.

///* - Consumer widgeti, Provider sınıfından veri alırken birkaç avantaj sağlar.
///* - Öncelikle, Consumer widgeti, yalnızca gerektiğinde çalıştırılır ve bu sayede performansı iyileştirir.
///* - Ayrıca, Consumer widgeti, veriler değiştiğinde otomatik olarak güncellenir ve bu sayede verilerin değiştiğini izleyen widgetlerin güncelleştirilmesine gerek kalmaz.