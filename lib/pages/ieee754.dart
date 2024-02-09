import 'package:flutter/material.dart';

class Ieee754 extends StatefulWidget {
  const Ieee754({Key? key}) : super(key: key);

  @override
  State<Ieee754> createState() => _Ieee754State();
}

class _Ieee754State extends State<Ieee754> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('IEEE 754 Converter'),
      )
    );
  }
}