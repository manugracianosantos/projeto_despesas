import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  // criamos uma lista fixa(por enquanto) que representa as transações feitas
  //para isso criamos uma classe com todas as informações necessárias
  final _transactions = [
    Transaction(id: "t1", title: "Uber", value: 25.80, date: DateTime.now()),
    Transaction(id: "t2", title: "Açai", value: 22.60, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas pessoais")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            //Para começar a interface do cadastro de transações, a ideia é pegar
            //cada item da lista e transformar em um card com as informações
            //Precisamos usar um .map que percorre o a lista e transforma cada 
            //elemento em um card, para isso o map retorna uma função tr que
            //faz exatamente isso 
            children: //tr = transações
                _transactions.map((tr) {
                  //criamos 
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 219, 118, 152),
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "R\$ ${tr.value.toStringAsFixed(2)}", //.toString() nn mais necessário pq quando usa a interpolação ele já faz essa conversão
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              //instalamos um pacote intl para arrumar a data
                              DateFormat('d MMM y').format(tr.date),
                              style: TextStyle(
                                color: const Color.fromARGB(255, 100, 99, 99),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
          Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Titulo"),
                  ), //????
                  TextField(
                    decoration: InputDecoration(labelText: "Valor(R\$)"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Nova Transação", style:TextStyle(
                          color: Colors.purple,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
