import 'dart:collection';

import 'package:binarytoolset/converters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignedNumbers extends StatefulWidget {
  const SignedNumbers({Key? key}) : super(key: key);

  @override
  State<SignedNumbers> createState() => _SignedNumbersState();
}

class _SignedNumbersState extends State<SignedNumbers> {
  String radioGroupValue = "Binary";
  String dropdownValue = "signMagnitude";
  final TextEditingController _decimalController = TextEditingController();
  final TextEditingController _encodedController = TextEditingController();
  HashMap<String, TextInputFormatter> inputFormatters = HashMap<String, TextInputFormatter>();

  @override
  initState(){
    super.initState();
    inputFormatters['Binary'] = FilteringTextInputFormatter.allow(RegExp(r'[0-1]'));
    inputFormatters['Octal'] = FilteringTextInputFormatter.allow(RegExp(r'[0-7]'));
    inputFormatters['Hexadecimal'] = FilteringTextInputFormatter.allow(RegExp(r'[0-9a-fA-F]'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Signed Numbers'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _decimalController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Decimal',
                    hintText: 'Enter a signed decimal number',
                  ),
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      switch(radioGroupValue){
                        case "Binary":
                          _encodedController.text = Converters.decimalToBinarySignMagnitude(int.parse(value));
                          break;
                        case "Octal":
                          _encodedController.text = Converters.decimalToOctalSignMagnitude(int.parse(value));
                          break;
                        case "Hexadecimal":
                          _encodedController.text = Converters.decimalToHexSignMagnitude(int.parse(value));
                          break;
                      }
                    }else{
                      _encodedController.text = '';
                    }
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _encodedController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: radioGroupValue,
                    hintText: "Enter a signed $radioGroupValue number",
                  ),
                  onChanged: (value) {
                    if(value.isNotEmpty){
                      switch(radioGroupValue){
                        case "Binary":
                          _decimalController.text = Converters.signMagnitudeBinaryToDecimal(value).toString();
                          break;
                        case "Octal":
                          _decimalController.text = Converters.signMagnitudeOctalToDecimal(value).toString();
                          break;
                        case "Hexadecimal":
                          _decimalController.text = Converters.signMagnitudeHexToDecimal(value).toString();
                          break;
                      }
                    }else{
                      _decimalController.text = '';
                    }
                  },
                  inputFormatters: [
                    inputFormatters[radioGroupValue]!,
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton(
                  itemHeight: 50,
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: Colors.green,
                  icon: const Icon(Icons.arrow_downward),
                  alignment: Alignment.center,
                  elevation: 16,
                  items: const [
                    DropdownMenuItem(value: 'signMagnitude', child: Text('Sign-Magnitude')),
                    DropdownMenuItem(value: 'baseComplement', child: Text('Base\'s Complement')),
                    DropdownMenuItem(value: 'baseMinusComplement', child: Text('Base Minus One\'s Complement')),
                    DropdownMenuItem(value: 'excessK', child: Text('Excess-K')),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  value: dropdownValue),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  value: "Binary",
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value.toString();
                    });
                  },
                  title: const Text('Binary')),
              RadioListTile(
                  value: "Octal",
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value.toString();
                    });
                  },
                  title: const Text('Octal')),
              RadioListTile(
                  value: "Hexadecimal",
                  groupValue: radioGroupValue,
                  onChanged: (value) {
                    setState(() {
                      radioGroupValue = value.toString();
                    });
                  },
                  title: const Text('Hexadecimal')),
            ],
          ),
        ));
  }
}
