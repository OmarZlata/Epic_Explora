import 'package:flutter/material.dart';

import '../../Widgets/Bank_card.dart';

// Assuming BankInfoCard is defined in bank_card.dart

class BankScreen extends StatelessWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFF1F1F1)),
        child: SafeArea(
          child: ListView.builder(
            itemCount: 10,

            itemBuilder: (context, index) {
              return BankInfoCard(
                bankName: "Cairo Bank",
                address: "Sample Address",
                status: "Open",
                openingTime: "12:50 PM",
              );
            },
          ),
        ),
      ),
    );
  }
}
