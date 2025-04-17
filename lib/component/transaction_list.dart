import 'package:expenses_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  //const TransactionList({super.key});
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      //Para começar a interface do cadastro de transações, a ideia é pegar
      //cada item da lista e transformar em um card com as informações
      //Precisamos usar um .map que percorre o a lista e transforma cada
      //elemento em um card, para isso o map retorna uma função tr que
      //faz exatamente isso
      children: //tr = transações
          transactions.map((tr) {
            //Aqui começamos a construção de cada Card
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
    );
  }
}
