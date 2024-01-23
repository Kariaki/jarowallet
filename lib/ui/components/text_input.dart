import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/extensions.dart';

class BasicTextInput extends StatelessWidget {
  final String title;
  final String hint;
  const BasicTextInput({super.key,required this.title,required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF2B2A29),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        4.spaceHeight(),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:  const TextStyle(
              color: Color(0xFF667398),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
