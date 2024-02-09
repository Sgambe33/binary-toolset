import 'package:binarytoolset/converters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController _binaryController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();
  final TextEditingController _octalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Base Converter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _binaryController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Binary',
                    hintText: 'Enter a binary number',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-1]')),
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _decimalController.text = Converters.binaryToDecimal(value).toString();
                      _octalController.text =
                          Converters.decimalToOctal(Converters.binaryToDecimal(value));
                      _hexController.text = Converters.decimalToHex(Converters.binaryToDecimal(value));
                    } else {
                      _binaryController.text = '';
                      _octalController.text = '';
                      _hexController.text = '';
                      _decimalController.text = '';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _octalController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Octal',
                    hintText: 'Enter an octal number',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-7]')),
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _decimalController.text = Converters.octalToDecimal(value).toString();
                      _binaryController.text =
                          Converters.decimalToBinary(Converters.octalToDecimal(value));
                      _hexController.text = Converters.decimalToHex(Converters.octalToDecimal(value));
                    } else {
                      _binaryController.text = '';
                      _octalController.text = '';
                      _hexController.text = '';
                      _decimalController.text = '';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _decimalController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Decimal',
                    hintText: 'Enter a decimal number',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _binaryController.text = Converters.decimalToBinary(int.parse(value));
                      _octalController.text = Converters.decimalToOctal(int.parse(value));
                      _hexController.text = Converters.decimalToHex(int.parse(value));
                    } else {
                      _binaryController.text = '';
                      _octalController.text = '';
                      _hexController.text = '';
                      _decimalController.text = '';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _hexController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Hexadecimal',
                    hintText: 'Enter an hexadecimal number',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9a-fA-F]')),
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _decimalController.text = Converters.hexToDecimal(value).toString();
                      _binaryController.text = Converters.decimalToBinary(int.parse(_decimalController.text));
                      _octalController.text = Converters.decimalToOctal(int.parse(_decimalController.text));
                    } else {
                      _binaryController.text = '';
                      _octalController.text = '';
                      _hexController.text = '';
                      _decimalController.text = '';
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
