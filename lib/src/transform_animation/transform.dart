import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransformAnimations extends StatefulWidget {
  const TransformAnimations({super.key});

  @override
  State<TransformAnimations> createState() => _TransformAnimationsState();
}

class _TransformAnimationsState extends State<TransformAnimations> {

  double _value = 0.5; // Valor estandar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uso del transform"),
      ),

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          const FlutterLogo(
            size: 100,
          ),

          const SizedBox(
            height: 80,
          ),

          // Transform.scale(
          //   scale: _value * 4,
          //   child: SvgPicture.asset( 
          //     'assets/usuario.svg',
          //     width: 100,
          //   ),
          // ),

          // Transform.rotate(
          //   angle: _value * 6.3,
          //   child: SvgPicture.asset( 
          //     'assets/usuario.svg',
          //     width: 100,
          //   ),
          // ),

          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(_value * 4.0) // animacion para agrandar la imagen
              ..setEntry(3, 2, 0.002) // animacion con efecto 3D
              ..rotateX(pi * (_value * 2)) // Rotacion en X
              ..rotateY(pi * (_value)), // Rotacion en Y
              //..rotateZ(pi * (_value * 2)), // Rotaion en Z
            child: SvgPicture.asset( 
              'assets/usuario.svg',
              width: 50,
            ),
          ),

          const SizedBox(
            height: 80,
          ),
          
          Slider(value: _value, 
            onChanged: (val) {
              setState(() {
                _value = val;
              });
            }
          ),

          Text("Value: ${_value.toStringAsFixed(1)}"),
        ],
      )),
    );
  }
}