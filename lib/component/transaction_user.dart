import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transactions = [
    Transaction(id: "t1", title: "Uber", value: 25.80, date: DateTime.now()),
    Transaction(id: "t2", title: "Açai", value: 22.60, date: DateTime.now()),
    Transaction(id: "t3", title: "Uber#01", value: 25.80, date: DateTime.now()),
    Transaction(id: "t4", title: "Uber#02", value: 25.80, date: DateTime.now()),
    Transaction(id: "t5", title: "Uber#03", value: 25.80, date: DateTime.now()),
    Transaction(id: "t6", title: "Uber#04", value: 25.80, date: DateTime.now()),
    Transaction(id: "t7", title: "Uber#05", value: 25.80, date: DateTime.now()),
    Transaction(id: "t8", title: "Uber#06", value: 25.80, date: DateTime.now()),
  ];
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(transactions),
      ],
    ); //???
  }
}
