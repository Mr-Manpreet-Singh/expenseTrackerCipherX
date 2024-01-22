import 'package:expense_tracker_app/database/database_helper.dart';
import 'package:expense_tracker_app/providers/account_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:provider/provider.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];
  final dbHelper = DatabaseHelper();

  List<TransactionModel> get transactions {
    return _transactions;
  }

  Future<void> loadTransactions(BuildContext context) async {
    // Load transactions from the database
    _transactions = await dbHelper.getTransactions();    

    context.read<AccountDetailsProvider>().updateByLoadingTransactionFromDataBase(_transactions);
    notifyListeners();
  }

  Future<void> addTransaction(TransactionModel newTransacction) async {
    await dbHelper.insertTransaction(newTransacction);
    _transactions.add(newTransacction);
    notifyListeners();
  }

  Future<void> removeTransaction(TransactionModel transactionToRemove) async {
    await dbHelper.deleteTransaction(transactionToRemove.id);
    _transactions.remove(transactionToRemove);
    notifyListeners();
  }
}
