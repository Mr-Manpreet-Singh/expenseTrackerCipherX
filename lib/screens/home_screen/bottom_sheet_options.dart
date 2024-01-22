import 'package:expense_tracker_app/screens/income_or_expense_screen/income_or_expense_screen.dart';
import 'package:flutter/material.dart';

class BottomSheetOptions extends StatelessWidget {
  const BottomSheetOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading:  Image.asset('assets/images/income.png',),
          title: const Text('Add Income'),
          onTap: () {
            Navigator.pop(context); 
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const AddExpenseOrIncome(isExpenseScreen: false);
              },
            ));
          },
        ),
        ListTile(
          leading: Image.asset('assets/images/expense.png',),
          title: const Text('Add Expense'),
          onTap: () {
            Navigator.pop(context); 
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return const AddExpenseOrIncome(isExpenseScreen:true);
              },
            ));
          },
        ),
      ],
    );
  }
}