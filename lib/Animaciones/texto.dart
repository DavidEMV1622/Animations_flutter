import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextoAnimations extends StatefulWidget {
  const TextoAnimations({super.key});

  @override
  State<TextoAnimations> createState() => _TextoAnimationsState();
}

class _TextoAnimationsState extends State<TextoAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animacion al texto"),
      ),

      body: Center(
        child: Column(children: <Widget>[

          Text("TITULO PRINCIPAL"),
          
          const SizedBox(
            height: 20,
            width: 20,
          ),

          SvgPicture.asset( 
            'assets/usuario.svg',
            width: 50,
          ),
          
        ]),
      ),
    );
  }
}