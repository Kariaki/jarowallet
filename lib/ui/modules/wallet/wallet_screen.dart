import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No Wallet Account',
            style: TextStyle(
              color: Color(0xFF2B2A29),
              fontSize: 20,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
          10.spaceHeight(),
          Text(
            'You do not have a Wallet account yet.',
            style: TextStyle(
              color: Color(0xFF828282),
              fontSize: 14,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
            ),
          ),
          10.spaceHeight(),
          PrimaryButton(buttonText: 'Create wallet',onPressed: (){},width: 285,)
        ],
      ),
    ));
  }
}
