import 'package:client_app/navigation/inavigation_service.dart';
import 'package:flutter/material.dart';

abstract class BasePage extends StatelessWidget {
  static const _defaultPadding = EdgeInsets.all(16);

  final EdgeInsetsGeometry padding;
  final bool showAppBar;

   const BasePage({
        Key? key,
        this.padding = _defaultPadding,
        this.showAppBar = true
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: padding,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.redAccent,
                  Colors.cyanAccent,
                  Colors.amberAccent
                ])),
        child: Align(
            alignment: Alignment.topCenter,
            child: buildPage(context)
        ),
      ),
      appBar: showAppBar ? AppBar(
        title: const Text('Watcher'),
        centerTitle: false,
        backgroundColor: Colors.white70,
        titleTextStyle: const TextStyle(color: Colors.black),
      ) : null,
    );
  }

  Widget buildPage(BuildContext context);
}
