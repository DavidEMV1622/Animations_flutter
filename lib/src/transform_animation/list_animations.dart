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

      body: CustomScrollView(
        controller: scrollController,

        slivers: <Widget>[
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final card = constructorImages[index];
            final cardPosition = index * sizeCards; // Obtiene la posición actual del primer card
            final difference = scrollController.offset - cardPosition;
            if (difference == 0) print(difference);

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: sizeCards,

                child: Card(
                  color: card.colorBase,

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
            );
          }, childCount: constructorImages.length))
        ],
      ),
    );
  }
}