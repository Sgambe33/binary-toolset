import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController _binaryController = TextEditingController();
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();
  final TextEditingController _octalController = TextEditingController();

  String decimalToBinary(int n) {
    String binary = '';
    while (n > 0) {
      binary = (n % 2).toString() + binary;
      n = n ~/ 2;
    }
    return binary;
  }

  String decimalToOctal(int n) {
    String octal = '';
    while (n > 0) {
      octal = (n % 8).toString() + octal;
      n = n ~/ 8;
    }
    return octal;
  }

  String decimalToHex(int n) {
    String hex = '';
    while (n > 0) {
      int rem = n % 16;
      if (rem < 10) {
        hex = rem.toString() + hex;
      } else {
        hex = String.fromCharCode(rem + 55) + hex;
      }
      n = n ~/ 16;
    }
    return hex;
  }

  int binaryToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    String reversed = n.split('').reversed.join();
    for (int i = 0; i < reversed.length; i++) {
      decimal += int.parse(reversed[i]) * pow(2, exp) as int;
      exp++;
    }
    return decimal;
  }

  int octalToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    String reversed = n.split('').reversed.join();
    for (int i = 0; i < reversed.length; i++) {
      decimal += int.parse(reversed[i]) * pow(8, exp) as int;
      exp++;
    }
    return decimal;
  }

  int hexToDecimal(String n) {
    int decimal = 0;
    int exp = 0;
    for (int i = n.length - 1; i > 0; i--) {
      if (n[i] == 'A' ||
          n[i] == 'B' ||
          n[i] == 'C' ||
          n[i] == 'D' ||
          n[i] == 'E' ||
          n[i] == 'F') {
        decimal += (n.codeUnitAt(i) - 55) * pow(16, exp) as int;
      } else {
        decimal += int.parse(n[i]) * pow(16, exp) as int;
      }
      exp++;
    }
    return decimal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
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
                    _decimalController.text = binaryToDecimal(value).toString();
                    _octalController.text =
                        decimalToOctal(binaryToDecimal(value));
                    _hexController.text = decimalToHex(binaryToDecimal(value));
                  } else {
                    _binaryController.text = '';
                    _octalController.text = '';
                    _hexController.text = '';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
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
                    _decimalController.text = octalToDecimal(value).toString();
                    _binaryController.text =
                        decimalToBinary(octalToDecimal(value));
                    _hexController.text = decimalToHex(octalToDecimal(value));
                  } else {
                    _binaryController.text = '';
                    _octalController.text = '';
                    _hexController.text = '';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
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
                    _binaryController.text = decimalToBinary(int.parse(value));
                    _octalController.text = decimalToOctal(int.parse(value));
                    _hexController.text = decimalToHex(int.parse(value));
                  } else {
                    _binaryController.text = '';
                    _octalController.text = '';
                    _hexController.text = '';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
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
                    _decimalController.text =
                        binaryToDecimal(decimalToBinary(int.parse(value)))
                            .toString();
                    _binaryController.text = decimalToBinary(
                        binaryToDecimal(decimalToBinary(int.parse(value))));
                    _octalController.text = decimalToOctal(
                        binaryToDecimal(decimalToBinary(int.parse(value))));
                  } else {
                    _binaryController.text = '';
                    _octalController.text = '';
                    _hexController.text = '';
                  }
                },
              ),
            ],
          ),
        ));
  }
}
