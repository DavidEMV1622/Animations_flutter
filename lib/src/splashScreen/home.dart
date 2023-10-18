import 'package:flutter/material.dart';

import '../principal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), 
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Principal()));
        },),

        title: const Text("HOME SCREEN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: const Center(child: Text("Estas en el Home Screen"),),
    );
    
  }
}