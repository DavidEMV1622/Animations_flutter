

import 'package:flutter/material.dart';

class AnimacionColor extends StatelessWidget {
  const AnimacionColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pasar de un color a otro"),
      ),

      body: Center(
        // Widget de animacion sencilla y personalizada
        child: TweenAnimationBuilder<Color?>(
           duration: const Duration(seconds: 3), // Tiempo que dura la animacion
          tween: ColorTween(begin: Colors.red, end: Colors.blue,),  /* Color en que inicia y finaliza */
          builder: (context, colorDinamico, _) { /* Interpolacion para agregar los valores que cambiaran en 
                                                la animacion */
            return Container(
              height: 250,
              width: 250,
              color: colorDinamico, /* La propiedad "color" obtiene el valor transformado para cambiar el 
                                    color tanto inicio y final (colorDinamico) */
            );
          }
        ),
      ),
    );
  }
}

