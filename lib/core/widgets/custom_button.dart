import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity - 20,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
