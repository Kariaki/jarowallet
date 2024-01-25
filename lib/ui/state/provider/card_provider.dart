import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/data/enum/enums.dart';
import 'package:jarowallet/data/repository/card_repository_impl.dart';
import 'package:jarowallet/data/repository/interface/card_repository.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

class CardProvider extends ChangeNotifier {
  CardRepository repository = CardRepositoryImplementation();
  List<CardEntity> _cards = [];

  UnmodifiableListView<CardEntity> get cards => UnmodifiableListView(_cards);

  void getCards() {
    repository.getAllCards().listen((event) {
      _cards = event.map((e) => e.toCardEntity()).toList();
      notifyListeners();
    });
  }

  void deleteCard(CardEntity card) {
    repository.deleteCardById(card.id!);
    _cards = repository.getCards().map((e) => e.toCardEntity()).toList();
    notifyListeners();
  }

  void addCard(CardEntity cardEntity, BuildContext context) {
    if (!cardEntity.isValidCard()) {
      context.showSnackbar('Invalid card details, please complete the form');
      return;
    }
    repository.addCard(cardEntity);
    _cards = repository.getCards().map((e) => e.toCardEntity()).toList();
    notifyListeners();
    context.showSnackbarSuccess('Card added', success: true);
    context.pop();
  }
}
