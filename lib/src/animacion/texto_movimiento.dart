import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextoMovimiento extends StatelessWidget {
  const TextoMovimiento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Texto en movimiento"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            // Widget de animacion sencilla y personalizada que va a manejar un double
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0,), // Interpolacion del inicio y final de la animación (value)
              duration: const Duration(seconds: 1), // Duración de animación
              builder: (context, value, child) {

                // Manejo del Transfform.translate
                /*Se utiliza para poder hacer una animación donde el moviendo del texto es de derecha a izquierda
                (eje X) y de arriba abajo (eje Y) usuando la propiedad "offset"*/
                return Transform.translate(
                  offset: Offset(0.0, -300 * value), /* Maneja como aparecera la animación 
                                                    entre el eje X y Y*/
                  child: child, // Lo que se va animar
                );
              },
              child: const Text("TITULO PRINCIPAL"), // widget animar (child)
            ),
            
            const SizedBox(
              height: 20,
            ),

            // Widget de animacion sencilla y personalizada que va a manejar un double
            // TweenAnimationBuilder<double>(
            //   tween: Tween(begin: 1.0, end: 0.0,), // Interpolacion del inicio y final de la animación (value)
            //   duration: const Duration(seconds: 1), // Duración de animación
            //   builder: (context, value, child) {
            //     // Manejo del Transfform.translate
            //     return Transform.translate(
            //       offset: Offset(-MediaQuery.of(context).size.width * value, 0.0), /* Maneja como aparecera la animación 
            //                                         entre el eje X y Y*/
            //       child: child, // Lo que se va animar
            //     );
            //   },
            //   child: SvgPicture.asset( 
            //     'assets/usuario.svg',
            //     width: 50,
            //   ), // widget animar (child)
            // ),

            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0,), // Interpolacion del inicio y final de la animación (value)
              duration: const Duration(seconds: 1), // Duración de animación
              builder: (context, value, child) {
                // Manejo del Transfform.translate
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(value * 4.0), // animacion para agrandar la imagen
                    //..rotateZ(pi * (_value * 2)), // Rotaion en Z
                  child: TweenAnimationBuilder<double>(
                    curve: Curves.bounceInOut,
              tween: Tween(begin: 1.0, end: 0.1,), // Interpolacion del inicio y final de la animación (value)
              duration: const Duration(seconds: 1), // Duración de animación
              builder: (context, value, child) {
                // Manejo del Transfform.translate
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(value * 4.0), // animacion para agrandar la imagen
                    //..rotateZ(pi * (_value * 2)), // Rotaion en Z
                  child: child,
                );
              },
              child: SvgPicture.asset( 
                    'assets/usuario.svg',
                    width: 50,
              ), // widget animar (child)
            ),
                );
              },
              child: SvgPicture.asset( 
                    'assets/usuario.svg',
                    width: 50,
              ), // widget animar (child)
            ),

            const SizedBox(
              height: 20,
            ),

            // Widget de animacion sencilla y personalizada que va a manejar un double
            // Manejo del segundo texto
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0,), // Interpolacion del inicio y final de la animación (value)
              duration: const Duration(seconds: 1), // Duración de animación
              curve: Curves.bounceOut, /* Curva de interpolacion para manejar la animacion antes de finalzar, 
                                      con "Curves.bounceOut" realiza un pequeño rebote despues de finalizar la animacion
                                      (Tambien existen otros manejos del "Curves." tocaria ir provando)*/
              builder: (context, value, child) {
                
                // Manejo del Transfform.translate (animacion lineal)
                return Transform.translate(
                  offset: Offset(0.0, 350 * value), /* Maneja como aparecera la animación 
                                                    entre el eje X y Y*/
                                    
                  child: child, // Lo que se va animar
                );
              },
              child: const Text("Finalmente, podemos asegurarnos de que el desempeño de una acción deslice-para-desechar sobre un elemento de la lista de tareas pendientes lo removerá de la lista.",
              textAlign: TextAlign.center
              ),  // widget animar (child)
            ),
          ]
        ),
      ),
    );
  }
}