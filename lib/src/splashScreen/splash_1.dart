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

  late Animation<double> controllerReducir;
  late Animation<double> controllerAgrandar;
  
  /* late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(); */

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  void initState() {
    
    var timeSplash = Duration(seconds: 4);
    Future.delayed(timeSplash, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));;
    });


    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2));
    
    controllerAgrandar = Tween(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)));
    
    controllerReducir = Tween(begin: 0.5, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)));


    _controller.forward();
    _controller.addListener(() {
      setState(() {});
      print(_controller.status);
      if (_controller.status == AnimationStatus.completed) {
        // controller0.reset();
        // controller0.reverse();

        _controller.repeat();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: (controllerReducir.value) * (MediaQuery.of(context).size.height * 0.03),
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

        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            //scale: controllerAgrandar.value * (MediaQuery.of(context).size.height * 0.03),
            scale:  (controllerAgrandar.value + controllerReducir.value) * (MediaQuery.of(context).size.height * 0.03),
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