import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ticketson/constants/rest_api_urls.dart';
import 'package:ticketson/modules/ticket/models/ticket.dart';
import 'package:ticketson/services/secure_storage/storage_service.dart';

class TicketProvider {
  final String _baseApi = RestApiUrls.baseUrl;
  final StorageService _storageService = StorageService.instance();

  Future<List<Ticket>> getTickets(String walletUid) async {
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

    String response = await rootBundle.loadString('assets/tickets.json');
    Map<String, dynamic> result = json.decode(response);
    final List<Ticket> data = List<Ticket>.from(
        result['data'].map((e) => Ticket.fromJson(e)).toList());
    await Future.delayed(const Duration(seconds: 2));
    return data;
  }
}
