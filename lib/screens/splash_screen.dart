import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_flutter_with_aim2u/screens/my_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    /// Kita pakai class Timer untuk membuat jeda dari app dimulai selama 3 detik untuk Splashcreen
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const MyHomePage(title: 'Flutter Demo Home Page')
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.white,
          child:FlutterLogo(size:MediaQuery.of(context).size.height - 32.0)
      ),
    );
  }
}
