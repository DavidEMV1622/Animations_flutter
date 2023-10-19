import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller;
  late final AnimationController _controllerHOLA;

  late Animation<double> controllerReducir;
  late Animation<double> controllerAgrandar;
  late Animation<double> controllerAgrandarHOLA;
  
  /* late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(); */

  @override
  void dispose() {
    _controller.dispose();
    _controllerHOLA.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    var timeSplash = Duration(seconds: 4);
    Future.delayed(timeSplash, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });


    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
    _controllerHOLA = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    controllerAgrandarHOLA = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controllerHOLA, curve: Interval(0.0, 1.0)) // Cambia el intervalo
    );
    
    controllerAgrandar = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0)) // Cambia el intervalo
    );

    /* controllerAgrandar = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)) // Cambia el intervalo
    ); */

    controllerReducir = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)) // Cambia el intervalo
    );

    /* controllerAgrandar = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0)) // Cambia el intervalo
    );

    controllerReducir = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(1.0, 0.0)) // Cambia el intervalo
    );
 */

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
      print(_controller.status);
      if (_controller.status == AnimationStatus.completed) {
        // controller0.reset();
        // controller0.reverse();
        _controller.forward();();
      }
    });

    _controllerHOLA.forward();
    _controllerHOLA.addListener(() {
      setState(() {
        if (_controllerHOLA.status == AnimationStatus.completed) {
        // controller0.reset();
        // controller0.reverse();
        _controllerHOLA.reverse();();
      }
      });
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {

          return Transform.scale(
            scale: controllerAgrandar.value * (MediaQuery.of(context).size.height * 0.03),
              child: child,
          );},
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.amber, // Cambia el color del borde aquí
                  width: 20.0, // Cambia el grosor del borde aquí
                ),
              )
            ),
          ),
        ),

        AnimatedBuilder(animation: _controllerHOLA,
          builder: (BuildContext context, Widget? child) {

          return Transform.scale(
            scale: controllerAgrandarHOLA.value * (MediaQuery.of(context).size.height * 0.03),
            /* scale: _controller.status != AnimationStatus.completed ?
            controllerAgrandar.value * (MediaQuery.of(context).size.height * 0.03) :
            controllerReducir.value * (MediaQuery.of(context).size.height * 0.03), */
            //scale: (controllerAgrandar.value - controllerReducir.value) * (MediaQuery.of(context).size.height * 0.03),
              child: child,
          );},
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              )
            ),
          ),
        ),
/* 
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0,),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {

            return Transform.scale(
              scale: value * (MediaQuery.of(context).size.height * 0.03),
              child: child,
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.amber, // Cambia el color del borde aquí
                  width: 20.0, // Cambia el grosor del borde aquí
                ),
              )
            ),
          ),
        ),

        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0,),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {

            return Transform.scale(
              scale: value * (MediaQuery.of(context).size.height * 0.03),
              child: child,
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              )
            ),
          ),
        ), */
      ]),
    );
  }
}