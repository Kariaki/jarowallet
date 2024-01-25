class WalletModel {
  final int walletId;
  final String walletName;
  final double balance;

  const WalletModel(
      {required this.walletId,
      required this.walletName,
      required this.balance});

  WalletModel fund(double amount) {
    return WalletModel(
        walletId: walletId, walletName: walletName, balance: amount);
  }
}
