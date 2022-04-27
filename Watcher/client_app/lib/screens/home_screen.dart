import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
          title: const Text('Watcher'),
        centerTitle: false,
        backgroundColor: Colors.white70,
        titleTextStyle: const TextStyle(color: Colors.black),
        actions: [
          ElevatedButton(onPressed: (){}, child: const Text('Tests')),
          ElevatedButton(onPressed: (){}, child: const Text('Notification')),
          const SizedBox(width: 128),
          ElevatedButton(onPressed: (){
          }, child: const Text('Sign Out'))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.redAccent,
                  Colors.cyanAccent,
                  Colors.amberAccent
                ])),
      ),
    );
  }
  
}