import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final IconData? icon;
  final TextStyle? textStyle;
  final bool? transparent;
  final String buttonText;
  final void Function()? onPressed;

  const PrimaryButton(
      {super.key,
      this.icon,
      this.textStyle,
      this.transparent,
        this.onPressed,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            buttonText,
            style: textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          )
        ],
      ),
    );
  }
}
