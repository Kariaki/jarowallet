import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';

class PrimaryButton extends StatefulWidget {
  final Icon? icon;
  final TextStyle? textStyle;
  final String buttonText;
  final double? width;
  final void Function()? onPressed;

  const PrimaryButton(
      {super.key,
      this.icon,
      this.textStyle,
      this.width,
      this.onPressed,
      required this.buttonText});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: MaterialButton(
        onPressed: widget.onPressed,
        color:  primary,
        minWidth: 150,
        height: 45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: widget.icon!,
              ),
            Text(
              widget.buttonText,
              style: widget.textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
