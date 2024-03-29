import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/data/enum/enums.dart';
import 'package:jarowallet/ui/components/app_scaffold.dart';
import 'package:jarowallet/ui/components/text_input.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';
import 'package:jarowallet/ui/state/provider/card_provider.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatefulWidget {
  final void Function(CardEntity) cardResult;

  const AddCardScreen({super.key, required this.cardResult});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cardPanController = TextEditingController();
  TextEditingController cardPinController = TextEditingController();

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);
    return AppScaffold(
        title: 'Add card',
        onBackPressed: () {},
        primaryButtonText: 'Add',
        onPrimaryButtonPressed: () {
          final random = Random(2).nextInt(1);
          final type = CardType.values[random];
          final cardEntity = CardEntity(
              cardNumber: cardNumberController.text,
              expiryDate: expiryDateController.text,
              id: DateTime.now().millisecondsSinceEpoch,
              type: type,
              cardPin: cardPinController.text,
              cvv: cardPanController.text);
          if(!_value) {
            widget.cardResult(cardEntity);
            return;
          }
          provider.addCard(cardEntity, context);
        },
        child: SingleChildScrollView(
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
                  controller: cardNameController,
                  title: 'Name on card',
                  hint: 'Enter',
                  onChange: (value) {}),
              15.spaceHeight(),
              BasicTextInput(
                  title: 'Card number',
                  inputType: TextInputType.number,
                  hint: 'Enter',
                  controller: cardNumberController,
                  onChange: (value) {}),
              15.spaceHeight(),
              BasicTextInput(
                  title: 'Expiry Date',
                  inputType: TextInputType.number,
                  controller: expiryDateController,
                  hint: 'Enter',
                  isDate: true,
                  onChange: (value) {}),
              BasicTextInput(
                  title: 'cvv',
                  inputType: TextInputType.number,
                  controller: cardPanController,
                  hint: 'Enter',
                  onChange: (value) {}),
              15.spaceHeight(),
              BasicTextInput(
                  title: 'Card Pin',
                  controller: cardPinController,
                  inputType: TextInputType.number,
                  hint: 'Enter',
                  onChange: (value) {}),
              10.spaceHeight(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _value = !_value;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Save Card',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1A2128),
                        fontSize: 14,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.spaceWidth(),
                    SizedBox(
                      height: 25,
                      child: Switch(
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
