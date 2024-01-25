import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/text_input.dart';
import 'package:jarowallet/ui/modules/wallet/fund_card.dart';

class FundAmountDialog extends StatefulWidget {
  const FundAmountDialog({super.key});

  @override
  State<FundAmountDialog> createState() => _FundAmountDialogState();
}

class _FundAmountDialogState extends State<FundAmountDialog> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: backgroundColor,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'View Request',
                style: TextStyle(
                  color: Color(0xFF2B2A29),
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              )
            ],
          ),
          50.spaceHeight(),
          Image.asset(
            'assets/images/illustration.png',
            width: 135,
            height: 109,
          ),
          10.spaceHeight(),
          Text(
            'Add Money to your wallet',
            style: TextStyle(
              color: Color(0xFF2B2A29),
              fontSize: 16,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          20.spaceHeight(),
          BasicTextInput(
            title: 'Amount',
            hint: '0.00',
            controller: amountController,
            onChange: (value) {},
            inputType: TextInputType.number,
          ),
          20.spaceHeight(),
          PrimaryButton(
            buttonText: 'Continue',
            onPressed: () {
              final amountText = amountController.text;
              if (amountText.isEmpty) {
                return;
              }
              try {
                final number = double.parse(amountText);
                if (number < 50) {
                  context.showSnackbar(
                      'Minimum of 50 naira is required to fund wallet');
                  return;
                }
                context.pop();
                context.push(FundWalletScreen(amount: amountText));
              } catch (e) {}
            },
          )
        ],
      ),
    );
  }
}
