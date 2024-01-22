import 'package:expense_tracker_app/providers/account_details_provider.dart';
import 'package:expense_tracker_app/screens/home_screen/home_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard({
    required this.isExpenseCard,
    super.key,
  });

  final bool isExpenseCard;

  @override
  Widget build(BuildContext context) {
    final String title = isExpenseCard ? 'Expense' : 'Income';
    final Color color =
        isExpenseCard ? const Color(0xFFFD3C4A) : const Color(0xFF00A86B);
    final String image = isExpenseCard
        ? 'assets/images/expense.png'
        : 'assets/images/income.png';

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: 80,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: ShapeDecoration(
                color: const Color(0xFFFBFBFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Image.asset(image),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: HomeScreenHelper.incomeExpenseTitleTextStyle,
                ),
                Consumer<AccountDetailsProvider>(
                  builder: (context, value, child) {
                    final amount = isExpenseCard
                        ? value.accountDetails.expense
                        : value.accountDetails.income;
                    return Text(
                      amount.toStringAsFixed(0),
                      style: HomeScreenHelper.amountTextStyle,
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
