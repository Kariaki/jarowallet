import 'package:flutter/cupertino.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/text_input.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Add card',
        onBackPressed: () {},
        primaryButtonText: 'Add',
        onPrimaryButtonPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add card to fund your wallet',
              style: TextStyle(
                color: Color(0xFF2B2A29),
                fontSize: 16,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            15.spaceHeight(),
            BasicTextInput(
                title: 'Name on card', hint: 'Enter', onChange: (value) {}),
            15.spaceHeight(),
            BasicTextInput(
                title: 'Card number',
                inputType: TextInputType.number,
                hint: 'Enter',
                onChange: (value) {}),
            15.spaceHeight(),
            BasicTextInput(
                title: 'Expiry Date',
                inputType: TextInputType.number,
                hint: 'Enter',
                isDate: true,
                onChange: (value) {}),
            15.spaceHeight(),
            BasicTextInput(
                title: 'Card Pin',
                inputType: TextInputType.number,
                hint: 'Enter',
                onChange: (value) {}),
          ],
        ));
  }
}
