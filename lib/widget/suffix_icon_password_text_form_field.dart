import 'package:flutter/material.dart';

class SuffixIconPasswordTextFormField extends StatelessWidget {
  const SuffixIconPasswordTextFormField(
      {Key? key, this.obscurePasswordTextInWidget = false, this.onTap})
      : super(key: key);
  final bool obscurePasswordTextInWidget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: obscurePasswordTextInWidget
          ? const Icon(Icons.remove_red_eye)
          : const Icon(Icons.remove_red_eye_outlined),
    );
  }
}
