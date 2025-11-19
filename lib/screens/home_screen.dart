import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/bank.dart';
import '../widgets/bank_card.dart';
import 'bank_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Bank> banks = [];

  @override
  void initState() {
    super.initState();
    loadBanks();
  }

  Future<void> loadBanks() async {
    final String response = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/data/banks.json');
    final data = jsonDecode(response) as List<dynamic>;
    setState(() {
      banks = data.map((e) => Bank.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: const Text(
          'Safe Banking',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: banks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: banks.length,
              itemBuilder: (context, index) {
                final bank = banks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BankCard(
                    bank: bank,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BankDetailScreen(bank: bank),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
