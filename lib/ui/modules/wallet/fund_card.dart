import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/text_input.dart';
import 'package:jarowallet/ui/modules/card/component/card_item_component.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';
import 'package:jarowallet/ui/modules/dialog/fund_amount_dialog.dart';

class FundWalletScreen extends StatefulWidget {
  const FundWalletScreen({super.key});

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
  int _selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Fund wallet',
        onBackPressed: () {},
        primaryButtonText: 'Fund',
        onPrimaryButtonPressed: () {
          context.displayDialog(FundAmountDialog());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select card to fund your wallet',
              style: TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 16,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            15.spaceHeight(),
            ...cards.map((e) {
              return CardItemComponent(
                entity: e,
                selected: _selectedCard == e.id,
                onPress: () {
                  setState(() {
                    _selectedCard = e.id;
                  });
                },
              );
            }).toList(),
            1.divide(thickness: .3),
            15.spaceHeight(),
            addButton()
          ],
        ));
  }

  Widget addButton() {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add,
            color: primary,
          ),
          3.spaceWidth(),
          Text(
            'Add card',
            style: TextStyle(
              color: primary,
              fontSize: 16,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
