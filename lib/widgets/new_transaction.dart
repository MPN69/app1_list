import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

//Este es el constructor de "NewTransaction", el cual bindea el puntero que enviamos desde el widget anterior, con la variable final "addTransaction"
  /* --> */ NewTransaction(this.addTransaction); //<---
//

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData(),
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
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.purple),
              ),
              onPressed: submitData,
              child: Text("Agregar transaccion"),
            ),
          ],
        ),
      ),
    );
  }
}
