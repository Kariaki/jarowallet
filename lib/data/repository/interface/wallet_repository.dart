import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

import '../../model/transaction_model.dart';
import '../../model/wallet_model.dart';

abstract class WalletRepository{
  void fundWallet(int amount,CardEntity cardEntity);
  void createWallet(String name);
  WalletModel? getWallet();
  List<TransactionModel> getTransactions();
}