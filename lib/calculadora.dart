import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'logica.dart';
// ignore_for_file: library_private_types_in_public_api

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final _logica = Logica();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 119, 255),
        title: const Text('Calculadora Flutter'),
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          const Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _logica.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1, Color textColor = Colors.white, Color backgroundColor = Colors.black12}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 24),
        ),
        onPressed: () {
          setState(() {
            _logica.applyCommand(label);
          });
        },
      ),
    );
  }
  

  Widget _buildKeyboard() {
    return Container(
      color: const Color.fromARGB(255, 40, 41, 65),
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('C', flex: 3, textColor: Colors.deepOrange),
                _buildKeyboardButton('<x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('*', textColor: Colors.lightGreen),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('+', textColor: Colors.lightGreen),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-', textColor: Colors.lightGreen),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0'),
                _buildKeyboardButton('=', flex: 2, textColor: Colors.lightGreen),
                _buildKeyboardButton('/', textColor: Colors.lightGreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
