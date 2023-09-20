
import 'package:flutter/material.dart';

import 'Animaciones/pasar_color_a_otro.dart';
import 'Animaciones/texto.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //child: AnimacionColor(),
        child: TextoAnimations(),
      ),
    );
  }
}