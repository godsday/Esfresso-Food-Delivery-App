import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String labeltext;
  final IconData icon;
  final bool val;
  final FormFieldValidator<String> validator;
  const CustomTextField({
    Key? key,
    this.val = false,
    required this.icon,
    required this.type,
    required this.controller,
    required this.labeltext,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: labeltext),
      keyboardType: type,
      obscureText: val,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        controller.text = value!;
      },
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
