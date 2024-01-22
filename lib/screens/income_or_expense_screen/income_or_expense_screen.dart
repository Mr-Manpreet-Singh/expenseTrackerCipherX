import 'package:expense_tracker_app/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker_app/utils/constants.dart';
import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/providers/account_details_provider.dart';
import 'package:expense_tracker_app/screens/income_or_expense_screen/continue_btn.dart';
import 'package:expense_tracker_app/screens/income_or_expense_screen/custom_drop_down.dart';
import 'package:expense_tracker_app/screens/income_or_expense_screen/amount_text_field.dart';
import 'package:expense_tracker_app/screens/income_or_expense_screen/income_expense_helper.dart';
import 'package:expense_tracker_app/screens/income_or_expense_screen/description_text_field.dart';

class AddExpenseOrIncome extends StatelessWidget {
  const AddExpenseOrIncome({super.key, required this.isExpenseScreen});

  final bool isExpenseScreen;

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        isExpenseScreen ? const Color(0xFF0077FF) : const Color(0xFF7B61FF);

    String paymentMode = '';
    String category = '';
    String description = '';
    double amount = 0;

    void onContinueButtonPressed() {
      if (paymentMode.isNotEmpty &&
          category.isNotEmpty &&
          description.isNotEmpty &&
          amount > 0) {
        TransactionModel newTransaction = TransactionModel(
          isExpense: isExpenseScreen,
          category: category,
          description: description,
          amount: amount,
          dateTime: DateTime.now(),
          paymentMode: paymentMode,
        );

        Provider.of<TransactionProvider>(context, listen: false)
            .addTransaction(newTransaction);
        Provider.of<AccountDetailsProvider>(context, listen: false)
            .updateByAddingTransaction(
                newTransaction.isExpense, newTransaction.amount);

        Navigator.of(context).pop();
      } else {
        customSnackBar(context, "Something Went Wrong!! Please Verify Your Input");
      }
    }

    return Scaffold(
      appBar: IncomeExpenseHelper.myAppBar(context, isExpenseScreen),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  IncomeExpenseHelper.howMuchTextBox,
                  AmountTextField(
                      enteredAmount: (enteredAmount) => amount = enteredAmount),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 10),
                  CustomDropDown(
                      options: categoryOptions,
                      hintText: 'Category',
                      onItemSelect: (selectedCategory) =>
                          category = selectedCategory),
                  DescriptionTextField(
                    enteredDescription: (enteredDescription) =>
                        description = enteredDescription,
                  ),
                  const SizedBox(height: 20),
                  CustomDropDown(
                    options: paymnetModeOptions,
                    hintText: 'Payment Mode',
                    onItemSelect: (selectedPaymentMode) =>
                        paymentMode = selectedPaymentMode,
                  ),
                  const SizedBox(height: 100),
                  Divider(color: bgColor),
                  ContinueButton(onTap: onContinueButtonPressed)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
