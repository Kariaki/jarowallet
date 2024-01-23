import 'package:flutter/cupertino.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/text_input.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Create wallet',
        onBackPressed: (){},
        primaryButtonText: 'Create wallet',
        onPrimaryButtonPressed: (){},
        child: Column(
      children: [
        BasicTextInput(title: 'Name', hint: 'Auto-filled', onChange: (value){}),
        15.spaceHeight(),
        BasicTextInput(title: 'Wallet-ID', hint: 'Auto-filled', onChange: (value){}),
      ],
    ));
  }
}
