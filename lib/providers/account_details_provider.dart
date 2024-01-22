import 'package:expense_tracker_app/models/account_model.dart';
import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:flutter/material.dart';

class AccountDetailsProvider extends ChangeNotifier {
  final AccountDetails _accountDetails =
      AccountDetails(income: 0, expense: 0, accountBalance: 0);

  AccountDetails get accountDetails => _accountDetails;

  updateByAddingTransaction(bool isExpense, double value) {
    if (isExpense) {
      _accountDetails.expense += value;
    } else {
      _accountDetails.income += value;
    }
    _accountDetails.accountBalance =
        _accountDetails.income - accountDetails.expense;

    debugPrint("${accountDetails.accountBalance}");
    debugPrint("${accountDetails.expense}");
    debugPrint("${accountDetails.income}");

    notifyListeners();
  }

  updateByRemovingTransaction(bool isExpense, double value) {
    if (isExpense) {
      _accountDetails.expense -= value;
    } else {
      _accountDetails.income -= value;
    }
    _accountDetails.accountBalance =
        _accountDetails.income - accountDetails.expense;
    notifyListeners();
  }

  updateByLoadingTransactionFromDataBase(
      List<TransactionModel> allTransactions) {
    for (TransactionModel transaction in allTransactions) {
      if (transaction.isExpense) {
        _accountDetails.expense += transaction.amount;
      } else {
        _accountDetails.income += transaction.amount;
      }
    }
    _accountDetails.accountBalance =
        _accountDetails.income - accountDetails.expense;
    notifyListeners();
  }
}
