import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/icons.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/radio_button.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

import '../../../../data/enum/enums.dart';

class CardItemComponent extends StatelessWidget {
  final CardEntity entity;
  final bool selected;
  final void Function() onPress;
  final void Function()? onDeleteClick;

  const CardItemComponent(
      {super.key,
      required this.entity,
      this.onDeleteClick,
      required this.onPress,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rowLeft(),
            IconButton(
                onPressed: () {
                  if (onDeleteClick != null) {
                    onDeleteClick!();
                  }
                },
                icon: AppIcon.deleteIcon)
          ],
        ),
      ),
    );
  }

  Row rowLeft() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppRadio(
          selected: selected,
          onClick: onPress,
        ),
        5.spaceWidth(),
        imageByType(entity.type),
        10.spaceWidth(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '**** **** **** ${entity.cardNumber.substring(entity.cardNumber.length - 4, entity.cardNumber.length)}',
              style: const TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            5.spaceHeight(),
            Text(
              'Expires ${entity.expiryDate} ',
              style: const TextStyle(
                color: Color(0xFF667398),
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget imageByType(CardType type) {
    if (type == CardType.master) {
      return AppIcon.masterCardIcon;
    }
    return AppIcon.visaCardIcon;
  }
}
