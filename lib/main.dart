// lib/main.dart
import 'package:flutter/material.dart';
import 'morse_code.dart';

void main() {
  runApp(MorseTranslatorApp());
}

class MorseTranslatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MorseTranslatorScreen(),
    );
  }
}

class MorseTranslatorScreen extends StatefulWidget {
  @override
  _MorseTranslatorScreenState createState() => _MorseTranslatorScreenState();
}

class _MorseTranslatorScreenState extends State<MorseTranslatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _translation = '';

  void _translateToMorse() {
    String text = _controller.text.toUpperCase();
    List<String> morseList = [];
    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      morseList.add(morseCode[char] ?? '');
    }
    setState(() {
      _translation = morseList.join(' ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Morse Translator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _translateToMorse,
              child: Text('Translate'),
            ),
            SizedBox(height: 16),
            Text('Morse Code: $_translation'),
          ],
        ),
      ),
    );
  }
}
