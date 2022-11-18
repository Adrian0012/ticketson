import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ticketson/modules/wallets/models/wallet.dart';

class WalletProvider {
  Future<List<Wallet>> getWallets() async {
    String response = await rootBundle.loadString('assets/wallets.json');
    Map<String, dynamic> result = json.decode(response);
    final List<Wallet> data = List<Wallet>.from(
        result['data'].map((e) => Wallet.fromJson(e)).toList());
    await Future.delayed(const Duration(seconds: 2));
    return data;
  }
}
