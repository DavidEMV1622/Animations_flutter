import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConstructorImages {
  final String title;
  final SvgPicture image;
  final String description;
  final Color colorBase;

  ConstructorImages({
    required this.title,
    required this.description,
    required this.image,
    required this.colorBase,
  });
}

const double tamanioImage = 160;

final constructorImages = <ConstructorImages>[
  ConstructorImages(
    title: "Arbol 1",
    description: "Icono de paisaje 1", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: tamanioImage,), 
    colorBase: Colors.yellow,
  ),

  ConstructorImages(
    title: "Arbol 2",
    description: "Icono de paisaje 2", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: tamanioImage,), 
    colorBase: Colors.red.shade100,
  ),

  ConstructorImages(
    title: "Arbol 3",
    description: "Icono de paisaje 3", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: tamanioImage,), 
    colorBase: Colors.blue,
  ),

  ConstructorImages(
    title: "Arbol 4",
    description: "Icono de paisaje 5", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: tamanioImage,), 
    colorBase: Colors.red,
  ),

  ConstructorImages(
    title: "Arbol 5",
    description: "Icono de paisaje 5", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: tamanioImage,), 
    colorBase: Colors.green,
  ),

  ConstructorImages(
    title: "Arbol 6",
    description: "Icono de paisaje 6", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: tamanioImage,), 
    colorBase: Colors.yellow.shade100,
  ),

  ConstructorImages(
    title: "Arbol 7",
    description: "Icono de paisaje 7", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: tamanioImage,), 
    colorBase: Colors.blue.shade100,
  ),

  ConstructorImages(
    title: "Arbol 8",
    description: "Icono de paisaje 8", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: tamanioImage,), 
    colorBase: Colors.green.shade200,
  ),

  ConstructorImages(
    title: "Arbol 9",
    description: "Icono de paisaje 9", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: tamanioImage,), 
    colorBase: Colors.grey,
  ),


  ConstructorImages(
    title: "Arbol 10",
    description: "Icono de paisaje 10", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: tamanioImage,), 
    colorBase: Colors.blue,
  ),

  ConstructorImages(
    title: "Arbol 11",
    description: "Icono de paisaje 11", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: tamanioImage,), 
    colorBase: Colors.purple.shade200,
  ),

  ConstructorImages(
    title: "Arbol 12",
    description: "Icono de paisaje 12", 
    image: SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: tamanioImage,), 
    colorBase: Colors.brown.shade300,
  ),
];