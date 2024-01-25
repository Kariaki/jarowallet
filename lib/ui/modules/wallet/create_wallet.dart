import 'package:flutter/cupertino.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/text_input.dart';
import 'package:jarowallet/ui/state/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  final TextEditingController nameController = TextEditingController();

  bool enableButton = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WalletProvider>(context, listen: true);
    final TextEditingController walletId =
        TextEditingController(text: provider.getWalletId());
    return AppScaffold(
        title: 'Create wallet',
        onBackPressed: () {},
        primaryButtonText: 'Create wallet',
        primaryButtonEnabled: enableButton,
        onPrimaryButtonPressed: () {
          provider.createWallet(nameController.text, context);
        },
        child: Column(
          children: [
            BasicTextInput(
                title: 'Name',
                hint: 'Auto-filled',
                controller: nameController,
                onChange: (value) {
                  setState(() {
                    enableButton = value.isNotEmpty;
                  });
                }),
            15.spaceHeight(),
            BasicTextInput(
                title: 'Wallet-ID',
                hint: 'Auto-filled',
                controller: walletId,
                enabled: false,
                onChange: (value) {}),
          ],
        ));
  }
}
