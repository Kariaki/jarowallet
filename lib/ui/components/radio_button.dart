import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/icons.dart';

class AppRadio extends StatelessWidget {
  final bool selected;
  final void Function() onClick;

  const AppRadio({super.key, required this.selected, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0),
        onPressed: onClick,
        icon: selected ? AppIcon.radioOnIcon : AppIcon.radioOffIcon);
  }
}
