import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';

class BasicTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final void Function(String) onChange;
  final bool isDate;
  final TextInputType inputType;
  final bool enabled;

  const BasicTextInput(
      {super.key,
      required this.title,
      required this.hint,
      this.inputType = TextInputType.text,
      required this.onChange,
      this.enabled = true,
      this.isDate = false});

  @override
  Widget build(BuildContext context) {
    final boarder = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Color(0xFFC2C7D6)),
      borderRadius: BorderRadius.circular(7),
    );
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
          onChanged: onChange,
          cursorColor: primary,
          enabled: enabled,
          keyboardType: inputType,
          maxLength: isDate ? 5 : null,
          selectionHeightStyle: BoxHeightStyle.tight,
          inputFormatters: !isDate
              ? []
              : [
                  // This formatter capitalizes the first letter of each word.
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) {
                      if (newValue.text.isNotEmpty) {
                        return TextEditingValue(
                          text: newValue.text.substring(0, 1).toUpperCase() +
                              newValue.text.substring(1),
                          selection: newValue.selection,
                        );
                      }
                      return newValue;
                    },
                  ),
                ],
          decoration: InputDecoration(
            hintText: hint,
            constraints: const BoxConstraints(maxHeight: 46),
            hintStyle: const TextStyle(
              color: Color(0xFF667398),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: boarder.copyWith(
                borderSide: const BorderSide(width: 1, color: primary)),
            enabledBorder: boarder,
            disabledBorder: boarder,
          ),
        )
      ],
    );
  }
}
