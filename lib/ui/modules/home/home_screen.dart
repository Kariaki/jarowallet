import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/button.dart';
import 'package:jarowallet/ui/components/card_container.dart';
import 'package:jarowallet/ui/components/transaction_component.dart';
import 'package:jarowallet/ui/modules/wallet/fund_card.dart';
import 'package:provider/provider.dart';

import '../../state/provider/wallet_provider.dart';
import '../dialog/fund_amount_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletProvider>(context, listen: true);
    return AppScaffold(
        title: 'Wallet',
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₦ ${provider.wallet?.balance.toInt().toString()}',
                          style: const TextStyle(
                            color: Color(0xFF67156E),
                            fontSize: 32,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'Current Balance',
                          style: TextStyle(
                            color: Color(0xFFD12B2F),
                            fontSize: 12,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    PrimaryButton(
                      buttonText: 'Fund wallet',
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.displayDialog(FundAmountDialog());
                      },
                    )
                  ],
                ),
              ),
              20.spaceHeight(),
              buildText(),
              20.spaceHeight(),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final transactionModel = provider.transactions[index];
                  return TransactionComponent(
                      transactionModel: transactionModel);
                },
                itemCount: provider.transactions.length,
              )
            ],
          ),
        ));
  }

  Text buildText() {
    return const Text(
      'Transaction History',
      style: TextStyle(
        color: Color(0xFF2B2A29),
        fontSize: 20,
        fontFamily: 'Work Sans',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
