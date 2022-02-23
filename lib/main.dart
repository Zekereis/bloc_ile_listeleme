import 'package:bloc_ile_listeleme/KisilerCubit.dart';
import 'package:bloc_ile_listeleme/KisilerDaoRepository.dart';
import 'package:bloc_ile_listeleme/KisilerDurum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> KisilerCubit(KisilerDaoRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Anasayfa(),
      ),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    context.read<KisilerCubit>().kisileriAlveTetikle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: BlocBuilder<KisilerCubit,KisilerDurum>(
        builder: (context,kisilerDurum){

          if(kisilerDurum is KisilerYuklendi){
            var kisiListesi = kisilerDurum.kisiListesi;

            return ListView.builder(
              itemCount: kisiListesi.length,
              itemBuilder: (context,indeks){
                var kisi = kisiListesi[indeks];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
