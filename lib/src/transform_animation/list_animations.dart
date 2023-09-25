import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimationsList extends StatelessWidget {
  const AnimationsList({super.key});

  @override
  Widget build(BuildContext context) {

    final List<SvgPicture> _listImages = [
      SvgPicture.asset('assets/ImagenesPaisajes/paisajeOne.svg', width: 10,),
      SvgPicture.asset('assets/ImagenesPaisajes/paisajeTwo.svg', width: 10,),
      SvgPicture.asset('assets/ImagenesPaisajes/paisajeThree.svg', width: 10,)
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Animations List"),
      ),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final images = _listImages[index];

            return Card(
              color:  Colors.amber,
              child: Row(children: <Widget>[
                Text("Valor $index"),
              ]),
            );
          }, childCount: _listImages.length))
        ],
      ),
    );
  }
}