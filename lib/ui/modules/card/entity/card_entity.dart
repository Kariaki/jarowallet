import 'package:flutter/material.dart';

enum CardType { master, visa, none }

class CardEntity {
  final int id;
  final String cardNumber;
  final String expiryDate;
  final CardType type;

  const CardEntity({
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.type,
  });
}

List<CardEntity> cards = [
  CardEntity(
      cardNumber: '5123894701238915',
      id: 1,
      expiryDate: '10/24',
      type: CardType.master),
  CardEntity(
      cardNumber: '514914383411024',
      id: 2,
      expiryDate: '04/23',
      type: CardType.visa),
];
