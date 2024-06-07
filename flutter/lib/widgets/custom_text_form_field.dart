import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.validator,
  });

  String? hintText;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: widget.validator,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration:  InputDecoration(
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: 'Password',
        fillColor: Colors.black,
        focusColor: Colors.black,
        suffixIcon: IconButton(onPressed: _toggle, icon: (_obscureText)
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),)
      ),
    );
  }
}
