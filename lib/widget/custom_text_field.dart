// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

/// versi stateless
class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.hintText,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.decoration,
      this.obscureText = false,
      })
      : super(key: key);
  final String labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final InputDecoration? decoration;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onChanged: onChanged,
        decoration: (decoration ?? const InputDecoration()).copyWith(
          label: Text(labelText),
          hintText: hintText,
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                  width: 3,
                  color: Colors.greenAccent)
          ),
        ),
        onSaved: onSaved,
        obscureText: obscureText,
      ),
    );
  }
}
