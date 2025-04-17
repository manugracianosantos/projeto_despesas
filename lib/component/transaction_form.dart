import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
//  const TransactionForm({super.key});
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                    print(valueController.text);
                  },
                  child: Text(
                    "Nova Transação",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
