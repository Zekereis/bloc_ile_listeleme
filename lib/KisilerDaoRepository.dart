import 'package:bloc_ile_listeleme/Kisiler.dart';

abstract class KisilerRepository{
  Future<List<Kisiler>> kisileriGetir();
}

class KisilerDaoRepository implements KisilerRepository{
  @override
  Future<List<Kisiler>> kisileriGetir() async {
    var  kisiListesi = <Kisiler>[];

    var k1 = Kisiler("1","Ahmet","11111");
    var k2 = Kisiler("2","Mehmet","22222");

    kisiListesi.add(k1);
    kisiListesi.add(k2);
    return kisiListesi;
  }

}