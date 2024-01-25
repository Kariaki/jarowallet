import 'package:jarowallet/data/enum/enums.dart';
import 'package:jarowallet/data/model/transaction_model.dart';
import 'package:jarowallet/data/model/wallet_model.dart';
import 'package:jarowallet/data/repository/interface/wallet_repository.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';

class WalletRepositoryImplementation extends WalletRepository {
  List<TransactionModel> _transactions = [];
  WalletModel? _currentWallet;

  @override
  void fundWallet(int amount, CardEntity cardEntity) {
    if (_currentWallet == null) {
      throw Exception('unable to fund wallet');
    }
    final currentBalance = _currentWallet!.balance + amount;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    _transactions.add(TransactionModel(
        walletId: _currentWallet!.walletId,
        type: TransactionType.credit,
        status: TransactionStatus.success,
        description: 'Funded wallet',
        amount: amount.toDouble(),
        card: cardEntity.toCardModel(cardEntity.id!),
        timestamp: timestamp,
        transactionId: timestamp));
    _currentWallet = _currentWallet!.fund(currentBalance);
  }

  @override
  List<TransactionModel> getTransactions() {
    return _transactions;
  }

  @override
  WalletModel? getWallet() {
    return _currentWallet;
  }

  @override
  void createWallet(String name) {
    final walletId = DateTime.now().millisecondsSinceEpoch;
    _currentWallet =
        WalletModel(walletId: walletId, walletName: name, balance: 0.0);
    _transactions = [];
  }
}
