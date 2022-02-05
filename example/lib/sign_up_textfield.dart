import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField(
      {Key? key,
      required this.icon,
      required this.labelText,
      this.validator,
      this.onChange, this.controller})
      : super(key: key);

  final String labelText;
  final IconData icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            labelText: "$labelText: ",
            icon: const Icon(Icons.first_page),
            hintText: "$labelText...",
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.grey)),
      ),
    );
  }
}
