import 'package:flutter/material.dart';

class CreateJoinButton extends StatelessWidget {
  const CreateJoinButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
