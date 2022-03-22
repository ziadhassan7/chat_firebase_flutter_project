import 'package:flutter/material.dart';

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({required this.textMessage, Key? key})
      : super(key: key);

  final String textMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      textMessage,
      style: const TextStyle(color: Colors.white),
    );
  }
}
