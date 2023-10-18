import 'package:flutter/material.dart';

import 'Constructor base/constructor_image.dart';

double sizeCards = 200; // Ancho de cada Card

class AnimationsList extends StatefulWidget {
  const AnimationsList({super.key});

  @override
  State<AnimationsList> createState() => _AnimationsListState();
}

class _AnimationsListState extends State<AnimationsList> {

  final scrollController = ScrollController(); // Controlador para manejar el funcionamiento del scroll

  void onListen() {
    setState(() {});
    //print("Valor del Scroll = ${scrollController.offset}");
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Animations List"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          controller: scrollController,
      
          slivers: <Widget>[
            const SliverAppBar(
              automaticallyImplyLeading: false, // Elimina el boton de flecha
              title: Center(child: Text("Iconos de Arboles", style: TextStyle(color: Colors.black, ),)),
              pinned: true, // "true" se queda fijo el appBar al hacer scroll, "false" lo contrario
              backgroundColor: Colors.amber,
              elevation: 0,
            ),

            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),

            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              final card = constructorImages[index];
              /* Se divide entre 1.25 para tomar en cuenta las cards que estan encima del otro 
              se saca multiplicando el espacio del heightFactor (0.8) por el valor aproximado (1.25)
              y el resultado tiene que dar 1, si no, es posible que la animacion del scroll se adelante (r > 1)
              o se retrase (r < 1) (OTRA FORMA 1)*/
              //final cardPositionOffset = index * sizeCards / 1.25; // Obtiene la posición actual del primer card
              
              /* Se multiplica el ancho de las cards (sizeCards) por 0.5 que es el espacio que se
              abarca cada card en uno encima del otro con el heightFacto para que no se adelante 
              ni se retrase la animacion al hacer el scroll (OTRA FORMA 2), esto mismo se aplica  */
              final cardPositionOffset = index * (sizeCards * 0.5);
              final difference = scrollController.offset - cardPositionOffset; 
              if (index == 0) print("Valor de diferencia entre cada card = $difference");
              //final percent = 1 - (difference / (sizeCards / 1.25)); 
              final percent = 1 - (difference / (sizeCards * 0.5));
              if (index == 0) print("Valor de interpolacion = $percent");
      
              /* 2 if para que se cumpla la condicion del Opacity 
              opacity >= 0.0 && opacity <= 1.0 is not true
              Y definir la interpolación entre 0 y 1*/
              double value = percent;
              if (percent < 0.0) value = 0.0;
              if (percent > 1.0) value = 1.0;
              
      
              return Align(
                heightFactor: 0.5,
                child: SizedBox(
                  height: sizeCards,
                    
                  child: Opacity(
                    opacity: value,
                    
                    child: Transform(
                      transform: Matrix4.identity()
                        ..scale(value, 1.0)
                        ,
                        alignment: Alignment.center,
                      child: Card(
                        shape: const RoundedRectangleBorder( // Manejo de los bordes
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        color: card.colorBase, // Color de la base
                                    
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Text("Titulo: ${card.title}"),
                                Text("Descripcion: ${card.description}"),
                              ],),
                            ),
                            card.image,
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: constructorImages.length /* Cantidad de scroll a realizar segun la lista de imagenes */ ))  
          ],
        ),
      ),
    );
  }
}