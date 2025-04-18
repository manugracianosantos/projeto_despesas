import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  //  const TransactionForm({super.key});
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit; //passar os dados do form

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

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
                    final title = titleController.text;
                    final value =
                        double.tryParse(valueController.text) ??
                        0.0; //??????????????
                    onSubmit(title, value);
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
