import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function onDelete;

  TransactionList(this._transactions, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
            return Column(
              children: [
                Text(
                  'No Transaction added',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: contraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: _transactions
                .map(
                  (tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    transaction: tx,
                    onDelete: onDelete,
                  ),
                )
                .toList(),
          );
  }
}
