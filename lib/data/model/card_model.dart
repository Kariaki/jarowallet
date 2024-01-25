import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

import '../enum/enums.dart';

class CardModel {
  final int id;
  final String cardNumber;
  final String expiryDate;
  final CardType type;
  final String cvv;
  final String cardPin;

  const CardModel({
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardPin,
    required this.type,
  });

  CardEntity toCardEntity() {
    return CardEntity(
        id: id,
        cardPin: cardPin,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        type: type,
        cvv: cvv);
  }
}
