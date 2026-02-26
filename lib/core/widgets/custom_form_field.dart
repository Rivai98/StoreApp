import 'package:flutter/material.dart';

class CustonFormField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextInputType textType;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final bool obsecureText; 
  const CustonFormField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.textType,
    required this.validator,
    required this.controller,
    this.obsecureText= false, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obsecureText,
        keyboardType: textType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[60]),
          hint: Text(hintText, style: TextStyle(color: Colors.grey[300])),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
