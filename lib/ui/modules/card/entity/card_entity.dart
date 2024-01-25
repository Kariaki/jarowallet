import 'package:flutter/material.dart';
import 'package:jarowallet/data/model/card_model.dart';

import '../../../../data/enum/enums.dart';

class CardEntity {
  final int? id;
  final String cardNumber;
  final String expiryDate;
  final CardType type;
  final String cvv;
  final String cardPin;

  const CardEntity({
    this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.type,
    required this.cardPin,
    required this.cvv,
  });

  CardModel toCardModel(int id) {
    return CardModel(
        id: id,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardPin: cardPin,
        cvv: cvv,
        type: type);
  }
  bool isValidCard(){
    return true;
  }
}

List<CardEntity> cards = [
  CardEntity(
      cardNumber: '5123894701238915',
      id: 1,
      expiryDate: '10/24',
      cardPin: '2323',
      cvv: '231',
      type: CardType.master),
  CardEntity(
      cardNumber: '514914383411024',
      id: 2,
      expiryDate: '04/23',
      cardPin: '4412',
      cvv: '344',
      type: CardType.visa),
];
