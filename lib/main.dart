import 'package:flutter/material.dart';
import 'dart:math';
import '../models/transaction.dart';
import 'component/transaction_list.dart';
import 'component/transaction_form.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'WinkyRough',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        useMaterial3: false, //versõa do design
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6A1E55),
          // // foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme(
          //define o esquema de cores do app
          //seedColor: Colors.red, -> esse bagui é tipo o MaterialColor mas nn quero usar
          brightness: Brightness.light,
          primary: Color(0xFFA64D79),
          onPrimary: Colors.white,
          secondary: Color(0xFF6A1E55), //essa seria a cor destaque
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Color(0xFF3B1C32),
          onSurface: Color(0xFF1A1A1D),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Novo Tênis de Corrida',
    //   value: 310.76,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Conta de Luz',
    //   value: 211.30,
    //   date: DateTime.now(),
    // ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop(); //esconde o modal logo depois de ser adicionado
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas pessoais"),
        // backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            // color: const Color.fromARGB(255, 55, 124, 57),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              //?
              child: Card(
                // color: Colors.blue,
                elevation: 5, //?
                child: Text('Gráfico'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // foregroundColor: Colors.white, // cor do ícone
        // backgroundColor: const Color.fromARGB(255, 55, 124, 57),
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation
              .centerFloat, //cuida da localização do botão (deixa ela no ladinho dps)
    );
  }
}
