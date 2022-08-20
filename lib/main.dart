import 'package:flutter/material.dart';
import 'package:learn_flutter_with_aim2u/screens/counter_app_screen.dart';

/// 1. main() function ini adalah entry point aplikasi flutter,
/// kadang disini ada kode inisiasi lainnya selain dari runApp()
void main() {
  /// di runApp ini Widget paling root dijalankan, disini namanya masih MyApp, bisa diubah kalau perlu
  runApp(const MyApp());
}

/// Root Widget mereturn MaterialApp
/// MaterialApp adalah yang memberikan App kita design2 basic (global) dari sebuah aplikasi flutter
/// disini tempat utama kita nentukan style UI app kita dan juga termasuk route nya
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 1. title => Nama App yang tampil di Icon Launcher
      title: 'Flutter with AIM2U',
      /// 2. debugShowCheckedModeBanner => banner penanda aplikasi dalam development, set false jika untuk prod
      debugShowCheckedModeBanner: false,
      /// 3. theme => disini kita bisa mengatur theme
      /// (primary color, secondary color, accent color, font size dll) global untuk lightmode kita
      theme: ThemeData(
        /// maksud dari primary swatch ini warnanya ada 10 shade yg bisa dipilih, defaultnya 500,
        /// bisa kita pilih dari sekian banyak swatch yg disediakan flutter atau buat sendiri
        /// dengan tipe data MaterialColor dan simpan jadi konstanta di suatu tempat
        primarySwatch: Colors.blue,
      ),
      /// 4. darktheme => disini kita bisa mengatur theme (primary color, secondary color, accent color, font size)untuk Dark Mode aplikasi kita
      /// kalau tidak diset, maka yang tampil theme normal (Light Mode)
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
      /// Route
      /// 5. home => ini adalah home Route aplikasi kita
      /// Disini kita bisa menentukan route kita dengan beberapa cara,
      /// untuk saat ini kita pakai cara default saja dulu
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const CounterAppScreen(title: 'Ini Counter App'),
    );
  }
}

/// 6. Stateful dan stateless
/// Kalau kita mengibaratkan aplikasi flutter dengan bahasa yang simple sebagai sebuah papan iklan,
/// stateless widget adalah banner iklan yang tidak bisa diubah kontennya setelah diprint
/// sedangkan,
/// stateful widget adalah banner iklan yang ditempatkan di layar LCD yang iklannya lebih dinamis dan bisa berubah,
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  /// Widget ini adalah homepage aplikasi kita. Widgetnya stateful yang artinya bisa berubah seperti yang sudah dijelaskan tadi
  /// Nilai2 awal / konfigurasi dari constructor dalam widget stateful selalu disimpan sebagai variabel final
  final String title;

  /// Kalau widget stateful, dia override method createState() yang mereturn class yang Implement Class State
  /// nah di class State tersebutlah nilai2 yang berubah dari suatu widget di manipulasi
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const Center(
        child: Text("Hai Ganteng"),
      ),
    );
  }

}
