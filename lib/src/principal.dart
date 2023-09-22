import 'package:flutter/material.dart';
import 'package:practicar_animacion/src/animacion/texto_movimiento.dart';


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

            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TextoMovimiento())), 
            child: const Text("Animacion de movimiento")),

            ElevatedButton(onPressed: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContadorIncrementar())), 
            child: const Text("Animacion de contador"))
          
          ]
        ),
      ),
    );
  }
}