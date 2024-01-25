import '../../model/wallet_model.dart';

abstract class WalletRepository{
  void fundWallet(int amount);
  Stream<WalletModel> getWalletBalance();
}