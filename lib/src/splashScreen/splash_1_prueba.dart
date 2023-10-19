import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreenT extends StatefulWidget {
  const SplashScreenT({super.key});

  @override
  State<SplashScreenT> createState() => _SplashScreenTState();
}

class _SplashScreenTState extends State<SplashScreenT> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late Animation<double> controllerAgrandar;
  late Animation<double> controllerReducir;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var timeSplash = Duration(seconds: 2);
    Future.delayed(timeSplash, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Ajusta la duración total de la animación
    );

    controllerAgrandar = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5)),
    );

    controllerReducir = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)),
    );

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
      print(_controller.status);
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              // Usa el valor de controllerAgrandar para escalar el círculo
              double scale = controllerAgrandar.value;

              if (_controller.status == AnimationStatus.completed) {
                // Si la animación está en reversa, usa la animación de reducción
                scale = controllerReducir.value;
              }

              return Transform.scale(
                scale: scale * (MediaQuery.of(context).size.height * 0.03),
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
                    color: Colors.amber,
                    width: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}