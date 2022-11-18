import 'dart:async';

import 'package:ticketson/modules/wallets/models/wallet.dart';
import 'package:ticketson/modules/wallets/provider/wallet_provider.dart';

class WalletRepository {
  final _walletProvider = WalletProvider();

  Future<List<Wallet>> getWallets() {
    return _walletProvider.getWallets();
  }
}

class NetworkError extends Error {}
