import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTx;
  final amountController = TextEditingController();
  final titleController = TextEditingController();
   NewTransaction(this.addTx);
   
void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                     onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                     onSubmitted: (_) => submitData(),
                  ),
                  TextButton(
                   onPressed: submitData,
                    child: Text("Add Transaction"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple)),
                  )
                ],
              ),
            ),
          );
  }
}