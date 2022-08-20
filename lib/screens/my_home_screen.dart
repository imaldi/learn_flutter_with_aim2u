import 'package:flutter/material.dart';

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
