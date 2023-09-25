import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewImagesAnimations extends StatefulWidget {
  const PageViewImagesAnimations({super.key});

  @override
  State<PageViewImagesAnimations> createState() => _PageViewImagesAnimationsState();
}

class _PageViewImagesAnimationsState extends State<PageViewImagesAnimations> {

  // Lista de imagenes
  final List<SvgPicture> _images = [
    SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: 50,),
    SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: 50,),
    SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: 50,)
  ];
  /* Future<void> _loadData() async {
    final response = await http.get(http://www.json-generator.com/api/json/get/bUbsitaEaG?indent=2);
    setState(() {
      _images = (jsonDecode(response.body) as List).map((e) => e["image"].toString()).toList();
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  } */

  final _pageController = PageController();  /* Controlador del PageView para 
                                            rastrear la posición actual. */
  double _currentPage = 0.0; // Almacena el valor porcentual de la imagen actual al hacer el scroll

  // Metodo para ir actualizando el valor del porcentaje "_currentPage"
  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  /* Se utilza el "initState" para que vez que cuando el usuario haga un scroll, 
  se llame al método "_listener()" para manejar los cambios en la posición 
  de la página. Es decir, el metodo "_listener()" actualiza la variable "_currentPage",
  que almacena el valor de la posición actual del PageView como un porcentaje. */
  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  /* Se utiliza el "dispose" para realizar la limpieza y liberación de recursos 
  cuando el widget "PageViewImagesAnimations" ya no se necesita, para que no alla 
  fugas de memoria ni problemas de recursos */
  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animacion PageView"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),

          // Uso del "PageView" para hacer scroll
          child: PageView.builder(
            controller: _pageController, // permite controlar el desplazamiento o scroll del PageView 
            itemCount:  _images.length, // Cantidad de desplazamiento o scroll a realizar
            itemBuilder: ((context, index) {
              final percent = _currentPage - index;
              final value = percent.clamp(0.0, 1.0); // Se define la interpolación de inicio y final

              print(percent); /* Imprime el valor del porcentaje actual al hacer el scroll entre
                              0 y 1 para poder identificar los cambios que hay a la hora de
                              realizar una animación al hacer un scroll*/

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Opacity(
                  opacity: 1 - value,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002) // Diseño 3D para cada imagen
                      ..scale(1 - value) // Tamaño de cada imagen
                      ..rotateZ((pi * value) * 2), // Rotacion en Z para cada imagen
                    child: _images[index]
                  ),
                ),
              );
          })),
        ),
      ),
    );
  }
}



