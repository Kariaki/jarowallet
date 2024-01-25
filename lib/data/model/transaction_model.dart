import 'package:jarowallet/data/enum/enums.dart';
import 'package:jarowallet/data/model/card_model.dart';

class TransactionModel {
  final int walletId;
  final int transactionId;
  final CardModel card;
  final double amount;
  final int timestamp;
  final TransactionStatus status;
  final TransactionType type;
  final String description;

  const TransactionModel(
      {required this.walletId,
      required this.type,
      required this.status,
      required this.description,
      required this.amount,
      required this.card,
      required this.timestamp,
      required this.transactionId});
}
