import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

//Este es el constructor de "NewTransaction", el cual bindea el puntero que enviamos desde el widget anterior, con la variable final "addTransaction"
  /* --> */ NewTransaction(this.addTransaction); //<---
//
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              /* onChanged: (value) {
                      titleInput = value;
                    }, */
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Titulo",
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              /* onChanged: (value) {
                      amountInput = value;
                    }, */
              controller: amountController,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple),
              ),
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text("Agregar transaccion"),
            ),
          ],
        ),
      ),
    );
  }
}
