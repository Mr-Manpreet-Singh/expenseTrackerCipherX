import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:expense_tracker_app/providers/account_details_provider.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/transaction_widgets/transaction_card.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({
    super.key,
  });

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Future<void> loadTransactions() async {
    await context.read<TransactionProvider>().loadTransactions(context);
    
  }

  @override
  void initState() {
    
    loadTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TransactionProvider>();
    final List<TransactionModel> transactions = provider.transactions;
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final TransactionModel transaction = transactions[index];
        return Dismissible(
          key: Key("${transaction.dateTime}"),
          background: Container(
            color: Colors.red,
            child: const Icon(
              Icons.delete_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            provider.removeTransaction(transaction);
            Provider.of<AccountDetailsProvider>(context, listen: false)
                .updateByRemovingTransaction(
                    transaction.isExpense, transaction.amount);
            customSnackBar(context, 'Transaction Deleted Successfully');
          },
          child: TransactionCard(
            transaction: transaction,
          ),
        );
      },
    );
  }
}
