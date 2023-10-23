import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';

class SplashScreenT extends StatefulWidget {
  const SplashScreenT({super.key});

  @override
  State<SplashScreenT> createState() => _SplashScreenTState();
}

class _SplashScreenTState extends State<SplashScreenT> with TickerProviderStateMixin {
  late final AnimationController _controller; // Controlador general de animacion

  // Variables para controlar los aspectos especificos e intervalos de cada animacion
  late Animation<double>? controllerSizeCircularBlue; // Agrandar y reducir circulo azul
  late Animation<double>? controllerOpacityCircularBlue; // Opacidad al circulo azul al reducirse
  late Animation<double>? controllerSizeCircularYellow; // Agrandar y reducir circulo amarillo
  late Animation<double>? controllerOpacityLogo; // Opacidad del logo al inicio del splash
  late Animation<double>? controllerOpacityIconAndSplashLogo; // Opacidad del icono y del logo ya finalizando el splash

  // Realiza liberacion de recursos para no tener problemas de renddimiento 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Inicia una vez que se muestre la pantalla
  @override
  void initState() {
    super.initState();
    // **** Se define el tiempo a esperar para pasar a la siguiente pantalla **** 
    var timeSplash = Duration(seconds: 4);
    Future.delayed(timeSplash, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

    // Permite definir el tiempo que va a durar la animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    //..forward(); // "..forward()" permite hacer que se inicie la animación
    
    startAnimation();
  }

  // Metodo para controlar el inicio, final y el intervalo de cada animacion al iniciarse
  void startAnimation() {

    if (_controller.status != AnimationStatus.completed) {

      controllerOpacityLogo = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));

      controllerSizeCircularBlue = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0))..addStatusListener(listenStatus));
      
      controllerOpacityCircularBlue = Tween(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.8)));

      controllerSizeCircularYellow = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));

      controllerOpacityIconAndSplashLogo = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0)));
      
    } else {
      controllerOpacityLogo = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0)));

      controllerSizeCircularBlue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.8, curve: Curves.bounceOut)));

      controllerOpacityCircularBlue = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.8)));

      controllerSizeCircularYellow = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0,)));

      controllerOpacityIconAndSplashLogo = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.2, 1.0)));
    }

    _controller.reset(); // Reinicia el la animacion (begin: 0.0)
    _controller.forward(); // Inicio de la animacion
  }

  void listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controllerSizeCircularBlue!.removeStatusListener(listenStatus);
      startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        // Animacion para el icono del final (opacidad)
        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: controllerOpacityIconAndSplashLogo!.value,
              child: child,
          );},
          child: const Padding(
            padding: EdgeInsets.only(top: 100,),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage("assets/icon.png"), height: 200,)
            ),
          ),
        ),

        // Animacion del logo del splash del final (Opacidad)
        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: controllerOpacityIconAndSplashLogo!.value,
              child: child,
          );},
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset( 
              'assets/logo_splash.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),

        // Animacion para el circulo amarillo del inicio (Agrandar)
        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {

          return Transform.scale(
            scale: controllerSizeCircularYellow!.value * (MediaQuery.of(context).size.height * 0.03),
            //scale: controllerAgrandar!.value, 
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
                  color: const Color.fromRGBO(255, 182, 0, 1),
                  width: 25.0,
                ),
              )
            ),
          ),
        ),

        // Animacion para el circulo azul en la mitad (Agrandar y reduccion con rebote "opacidad en reduccion")
        AnimatedBuilder(animation: _controller,
          builder: (BuildContext context, Widget? child) {

          return Opacity(
            opacity: controllerOpacityCircularBlue!.value,
            child: Transform.scale(
              scale: controllerSizeCircularBlue!.value * (MediaQuery.of(context).size.height * 0.03),
              child: child,
            ),
          );},
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(0, 175, 170, 1),
              )
            ),
          ),
        ),

        // Animacion para el logo del inicio (opacidad)
        AnimatedBuilder(animation: _controller, 
        builder: (BuildContext context, Widget? child) {
          return Opacity(opacity: controllerOpacityLogo!.value,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset( 
                'assets/logo_credibanco_login.svg',
                width: 250,
              ),
            ),
          );
        }),

      ]),
    );
  }
}