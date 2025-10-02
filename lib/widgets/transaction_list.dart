import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTx;
  final List<Transaction> transaction; 
  TransactionList(this.transaction, this.deleteTx,);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleLarge, 
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
