import 'package:flutter/material.dart';

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
  /// nah ini contoh variable state nya
  int _counter = 0;

  /// ini function yang merubah state dan di panggil di salah satu method lifecycle dari State ex: initState, build, dispose, etc
  void _incrementCounter() {
    /// setState ini ibarat tombol refresh untuk StatefulWidget, setiap dipanggil akan merefresh widget
    /// kalau kita cuma ubah value tanpa panggil setState, tampilan di layar ga akan berubah karena method build ga terpanggil lagi
    setState(() {
      _counter++;
    });
  }

  /// 7. build method
  /// ini lifecycle utama dari aplikasi Flutter, tempat widget benar2 di build untuk tampil di layar,
  /// method ini terpanggil setiap kali setState dipanggil, contohnya seperti di method _incrementCounter di atas
  @override
  Widget build(BuildContext context) {
    /// 8. Scaffold ini biasanya dipakai untuk membuat satu page, karena didalamnya disediakan hal2 dasar dari suatu page,
    /// seperti appbar, body, floating action button, bottom navigation bar, dll
    return Scaffold(
      /// 9. Appbar ya taulah ya
      appBar: AppBar(
        /// disini kita ambil value dari MyHomePage widget, mengaksesnya dengan getter widget.title
        title: Text(widget.title),
      ),
      /// 10. body ini inti konten halaman ini
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      /// 11. floating action button ini optional, kalau ga mau bisa dihilangin aja
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
