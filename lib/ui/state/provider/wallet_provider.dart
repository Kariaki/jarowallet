import 'package:flutter/cupertino.dart';
import 'package:jarowallet/core/extensions.dart';
import 'package:jarowallet/data/model/transaction_model.dart';
import 'package:jarowallet/data/model/wallet_model.dart';
import 'package:jarowallet/data/repository/interface/wallet_repository.dart';
import 'package:jarowallet/data/repository/wallet_repository.dart';
import 'package:jarowallet/ui/modules/card/entity/card_entity.dart';
import 'package:jarowallet/ui/modules/home/home_screen.dart';

class WalletProvider extends ChangeNotifier {
  final WalletRepository repository = WalletRepositoryImplementation();
  WalletModel? _wallet;

  WalletModel? get wallet => _wallet;
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  init() {
    getWallet();
  }

  void getWallet() {
    _wallet = repository.getWallet();
    notifyListeners();
  }

  String getWalletId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void fundWallet(int amount, CardEntity cardEntity) {
    repository.fundWallet(amount, cardEntity);
    getTransactions();
  }

  void createWallet(String name, BuildContext context) {
    repository.createWallet(name);
    getWallet();
    getTransactions();
    context.showSnackbarSuccess('Wallet created', success: true);
    context.push(HomeScreen());
  }

  void getTransactions() {
    _transactions = repository.getTransactions();
    notifyListeners();
  }
}
