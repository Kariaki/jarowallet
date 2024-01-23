import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/text_input.dart';

class FundAmountDialog extends StatefulWidget {
  const FundAmountDialog({super.key});

  @override
  State<FundAmountDialog> createState() => _FundAmountDialogState();
}

class _FundAmountDialogState extends State<FundAmountDialog> {
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
            onChange: (value) {},
            inputType: TextInputType.number,
          ),
          20.spaceHeight(),
          PrimaryButton(
            buttonText: 'Continue',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
