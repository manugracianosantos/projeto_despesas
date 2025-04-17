import 'package:flutter/material.dart';
import 'package:expenses_project/component/transaction_user.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas pessoais")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            //?
            child: Card(
              color: Colors.blue,
              elevation: 5, //?
              child: Text('Gráfico'),
            ),
          ),

          TransactionUser(),
        ],
      ),
    );
  }
}
