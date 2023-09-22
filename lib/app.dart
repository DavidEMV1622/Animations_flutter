
import 'package:flutter/material.dart';
import 'package:practicar_animacion/src/principal.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Principal(),
      ),
    );
  }
}