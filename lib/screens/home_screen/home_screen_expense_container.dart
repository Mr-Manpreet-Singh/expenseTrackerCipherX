import 'package:expense_tracker_app/screens/home_screen/account_balance.dart';
import 'package:expense_tracker_app/screens/home_screen/home_screen_helper.dart';
// import 'package:expense_tracker_app/screens/home_screen/income_expense_card.dart';
import 'package:expense_tracker_app/screens/home_screen/income_expense_card.dart';
import 'package:flutter/material.dart';

class HomeScreenExpenseContainer extends StatelessWidget {
  const HomeScreenExpenseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.amber[50],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          HomeScreenHelper.myAppBar,
          const AccountBalance(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IncomeExpenseCard(
                isExpenseCard: false,
              ),
              IncomeExpenseCard(
                isExpenseCard: true,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  
  
}
