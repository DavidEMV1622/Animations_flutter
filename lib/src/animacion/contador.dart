import 'package:flutter/material.dart';

class ContadorIncrementar extends StatefulWidget {
  const ContadorIncrementar({super.key});

  @override
  State<ContadorIncrementar> createState() => _ContadorIncrementarState();
}

class _ContadorIncrementarState extends State<ContadorIncrementar> {
  int _counter = 0; // Contador nuevo que va ir aumentando
  int? _oldCounter; // Contador viejo que guarda el valor anterior del _counter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador con animacion"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            // Manejo de la animacion de dos numeros (nuevo y anterior)
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0), /* Interpolacion del inicio y final de la animación (value) 
                                                  0.0 no va aparecer el valor y 1.0 aparece el valor*/
              key: Key(_counter.toString()), /* Esta llave permite que la animación se 
                                            pueda visualizar a la hora de cambiar el 
                                            valor del "_counter" */
              duration: const Duration(milliseconds: 200),
              builder: (context, value, _) {

                // Widget "Stack" permite apilar widgets uno encima del otro
                return Stack(
                  children: [
                    /* Condicion que no se cumple cuando inicia la pantalla del contador; 
                    esto es para no mostrar el valor anterior a la hora de entrar a la 
                    pantalla y solo se muestra en valor nuevo */
                    if (_oldCounter != null)
                      // Texto con valor anterior
                      Opacity(
                        opacity: 1 - value, /* si se muestra el valor (value => 1), ahora no se 
                                            muestra el valor por pantalla (1 - value => 0) */
                        child: Transform.translate(
                          offset: Offset(50 * value, 0.0), // (Desaparece el valor de izquierda a derecha)
                          child: Text( "$_oldCounter",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),

                    // Texto con valor nuevo
                    Opacity(
                      opacity: value, // se muestra el valor por pantalla (value = 1)
                      child: Transform.translate(
                        offset: Offset(-50 * (1 - value), 0.0), // (Aparece el valor de izquierda a derecha)
                        child: Text( "$_counter",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _oldCounter = _counter; /* Se almacena el valor nuevo (_counter) al anterior en "_oldCounter" 
                                  antes de que se auto incremente el "_counter" */
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}