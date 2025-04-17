import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transactions = [
    Transaction(id: "t1", title: "Uber", value: 25.80, date: DateTime.now()),
    Transaction(id: "t2", title: "Açai", value: 22.60, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      TransactionList(transactions),
      TransactionForm(),
     
      ]
        
    );
  }
}
