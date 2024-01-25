import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/text_input.dart';
import 'package:jarowallet/ui/modules/card/add_card.dart';
import 'package:jarowallet/ui/modules/card/component/card_item_component.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';
import 'package:jarowallet/ui/modules/dialog/fund_amount_dialog.dart';
import 'package:jarowallet/ui/state/provider/card_provider.dart';
import 'package:jarowallet/ui/state/provider/wallet_provider.dart';

import 'package:provider/provider.dart';

class FundWalletScreen extends StatefulWidget {
  final String amount;

  const FundWalletScreen({super.key, required this.amount});

  @override
  State<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends State<FundWalletScreen> {
  int _selectedCardId = -1;

  CardEntity? selectedCard;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context, listen: true);
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    return AppScaffold(
        title: 'Fund wallet',
        onBackPressed: () {},
        primaryButtonText: 'Fund',
        primaryButtonEnabled: provider.cards.isNotEmpty,
        onPrimaryButtonPressed: () {
          if (selectedCard == null) {
            context.showSnackbar('Please select a payment card');
            return;
          }
          walletProvider.fundWallet(int.parse(widget.amount), selectedCard!);
          context.showSnackbar('Card funded with ₦ ${widget.amount}');
          context.pop();
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
            ...provider.cards.map((e) {
              return CardItemComponent(
                entity: e,
                onDeleteClick: () {
                  provider.deleteCard(e);
                },
                selected: _selectedCardId == e.id,
                onPress: () {
                  setState(() {
                    _selectedCardId = e.id!;
                    selectedCard = e;
                  });
                },
              );
            }).toList(),
            1.divide(thickness: .3),
            15.spaceHeight(),
            addButton(provider)
          ],
        ));
  }

  Widget addButton(CardProvider provider) {
    return InkWell(
      onTap: () {
        context.push(AddCardScreen(cardResult: (result) {
          setState(() {
            selectedCard = result;

          });
        }));
      },
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
