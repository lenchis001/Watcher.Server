import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget{
  final Widget child;
  final String header;

  const Panel({
    Key? key,
    required this.header,
    required this.child
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 32),
          child
        ],
      ),
    );
  }
}