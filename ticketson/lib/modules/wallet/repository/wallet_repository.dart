import 'dart:async';

import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/modules/wallet/provider/wallet_provider.dart';

class WalletRepository {
  final _walletProvider = WalletProvider();

  Future<List<Wallet>> getWallets() {
    return _walletProvider.getWallets();
  }
}

class NetworkError extends Error {}
