import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({super.key});
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:
          transactions.isEmpty
              ? Column(
                children: [
                  Text(
                    'Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 100),
                  SizedBox(
                    height: 170,
                    child: Image.asset(
                      'lib/assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                //o .builder faz ele nn querer mais experar um builder
                //começar a renderizar os elmeentos que apenas estão na tela
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = (transactions[index]);
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
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2.0,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "R\$ ${tr.value.toStringAsFixed(2)}", //.toString() nn mais necessário pq quando usa a interpolação ele já faz essa conversão
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr.title,
                              style: Theme.of(context).textTheme.headlineLarge,
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
                },
              ),
    );
  }
}
