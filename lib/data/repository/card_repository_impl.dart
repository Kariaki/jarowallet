import 'package:jarowallet/data/model/card_model.dart';
import 'package:jarowallet/data/repository/interface/card_repository.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

class CardRepositoryImplementation extends CardRepository {
  final List<CardModel> cards = [];

  @override
  void addCard(CardEntity card) {
    final dateTimeId = DateTime.now().millisecondsSinceEpoch;
    final cardModel = card.toCardModel(dateTimeId);
    cards.add(cardModel);
  }

  @override
  void deleteCardById(int cardId) {
    cards.removeWhere((element) => element.id == cardId);
  }

  @override
  Stream<List<CardModel>> getAllCards() async* {
    yield cards;
  }

  @override
  List<CardModel> getCards() => cards;
}
