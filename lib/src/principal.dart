import 'package:flutter/material.dart';
import 'package:practicar_animacion/src/animacion/texto_movimiento.dart';
import 'package:practicar_animacion/src/transform_animation/PageViewImagesAnimations.dart';
import 'package:practicar_animacion/src/transform_animation/transform.dart';


import 'animacion/contador.dart';
import 'animacion/pasar_color_a_otro.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BOTONES PRINCIPALES"),
      ),

      body: Center(
        child: Column(
          children: [
            
            const SizedBox(
              height: 20,
            ),

            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const  AnimacionColor())), 
            child: const Text("Pasar color a otro")),

            const SizedBox(
              height: 10,
            ),
            
            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TextoMovimiento())), 
            child: const Text("Animacion de movimiento")),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContadorIncrementar())), 
            child: const Text("Animacion de contador")),

            const SizedBox(
              height: 10,
            ),
          
            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TransformAnimations())), 
            child: const Text("Uso del transform")),

            const SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PageViewImagesAnimations())), 
            child: const Text("transform en PageView")),

            const SizedBox(
              height: 10,
            ),
          
          ]
        ),
      ),
    );
  }
}