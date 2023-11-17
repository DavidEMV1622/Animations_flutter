/* import 'package:flutter/material.dart';
import 'movimiento_model.dart';

class MovimientosCard extends StatelessWidget {
  final Movimiento movimientosList;
  const MovimientosCard({super.key, required this.movimientosList});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      width: MediaQuery.of(context).size.width,

      child: SizedBox(
        height: 100,
        width: size.width,
        child: Card(
          elevation: 10.0,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(children: [
                    const CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black54,
                      child: Icon(
                        Icons.south_east_rounded,
                        size: 25,
                      )
                      
                    ),
                    const SizedBox(width: 10),
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(movimientosList.name, style: TextStyle(fontSize: 16)),

                        Text(movimientosList.id.toString(), style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Row(children: [
                      const Text("\$", style: TextStyle(fontSize: 16)),
                      Text(movimientosList.valor.toString(), style: const TextStyle(fontSize: 16)),
                    ]),
                    Text(movimientosList.fecha, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
} */