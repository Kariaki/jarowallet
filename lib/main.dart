import 'package:flutter/material.dart';
import 'package:jarowallet/core/config/colors.dart';
import 'package:jarowallet/ui/modules/card/add_card.dart';
import 'package:jarowallet/ui/modules/wallet/create_wallet.dart';
import 'package:jarowallet/ui/modules/wallet/fund_card.dart';
import 'package:jarowallet/ui/modules/wallet/wallet_screen.dart';
import 'package:jarowallet/ui/state/provider/card_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CardProvider()..getCards())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
      ),
      home: FundWalletScreen(),
    );
  }
}
