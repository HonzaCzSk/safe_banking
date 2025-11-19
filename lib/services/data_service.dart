import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/bank.dart';

class DataService {
  Future<List<Bank>> loadBanks() async {
    String jsonString = await rootBundle.loadString('assets/data/banks.json');
    final data = json.decode(jsonString);
    List banksJson = data['banks'];
    return banksJson.map((json) => Bank.fromJson(json)).toList();
  }
}
