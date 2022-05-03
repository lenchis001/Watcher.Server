import 'package:client_app/components/panel.dart';
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
                padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(children: [
              Panel(
                  header: "Tests" ,
                  child: SizedBox(
                    width: 480,
                    height: 256,
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: Text("SignIn flow test"),
                              ),
                              Expanded(
                                child: Text("Enabled", style: TextStyle(color: Colors.green),),
                              ),
                              Expanded(
                                child: Text("Failed", style: TextStyle(color: Colors.redAccent),),
                              ),
                        ]);
                      },
                    )
                  )
              ),
            ],)
          ],
        ),
      ),
    );
  }
  
}