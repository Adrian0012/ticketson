import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ticketson/constants/rest_api_urls.dart';
import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/services/secure_storage/storage_item.dart';
import 'package:ticketson/services/secure_storage/storage_service.dart';

class WalletProvider {
  final String _baseApi = RestApiUrls.baseUrl;
  final StorageService _storageService = StorageService.instance();

  Future<List<Wallet>> getWallets() async {
    // String? securityToken =
    //     await _storageService.read(key: Token.key) as String;
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "Accept": "application/json",
    //   "Authorization": "Token $securityToken",
    // };
    // Response response = await get(
    //   Uri.parse('$_baseApi/wallets/'),
    //   headers: headers,
    // );
    // if (response.statusCode == 200) {
    //   final responseData = json.decode(response.body);
    //   if (responseData != null) {
    //     final List<Wallet> result = List<Wallet>.from(
    //         responseData.map((e) => Wallet.fromJson(e)).toList());
    //     return result;
    //   } else {
    //     throw 'API GET Wallet List Error';
    //   }
    // } else {
    //   throw 'API Error';
    // }

    String response = await rootBundle.loadString('assets/wallets.json');
    Map<String, dynamic> result = json.decode(response);
    final List<Wallet> data = List<Wallet>.from(
        result['data'].map((e) => Wallet.fromJson(e)).toList());
    return data;
  }
}
