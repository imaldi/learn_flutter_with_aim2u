import 'package:flutter/material.dart';

class CounterAppScreen extends StatefulWidget {
  const CounterAppScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CounterAppScreenState createState() => _CounterAppScreenState();
}

class _CounterAppScreenState extends State<CounterAppScreen> {
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

  void _decrementCounter() {
    /// setState ini ibarat tombol refresh untuk StatefulWidget, setiap dipanggil akan merefresh widget
    /// kalau kita cuma ubah value tanpa panggil setState, tampilan di layar ga akan berubah karena method build ga terpanggil lagi
    setState(() {
      _counter--;
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 16.0,
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Text("-", style: TextStyle(color: Colors.white, fontSize: 30),),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
