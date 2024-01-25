import 'package:flutter/material.dart';
import 'package:jarowallet/data/model/card_model.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

abstract class CardRepository{

  void addCard(CardEntity card);
  Stream<List<CardModel>> getAllCards();
 List<CardModel> getCards();
  void deleteCardById(int cardId);
}