import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/text_input.dart';

class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Fund wallet',
        onBackPressed: () {},
        primaryButtonText: 'Fund',
        onPrimaryButtonPressed: () {},
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
