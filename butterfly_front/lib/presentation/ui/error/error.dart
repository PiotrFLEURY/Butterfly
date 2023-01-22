import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key, required this.message});

  final Exception? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message.toString()),
      ),
    );
  }
}
