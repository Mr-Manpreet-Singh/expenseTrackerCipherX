import 'package:expense_tracker_app/transaction_widgets/date_time_format.dart';
import 'package:expense_tracker_app/transaction_widgets/transaction_icon_style.dart';
import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:expense_tracker_app/transaction_widgets/transaction_text_styles.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.transaction,
    super.key,
  });

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> iconDecoration =
        decorateMyIcon(transaction.category);
    final IconData icon = iconDecoration['icon'] as IconData;
    final Color bgColor = iconDecoration['bgColor'] as Color;
    final Color iconColor = iconDecoration['iconColor'] as Color;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.category,
                style: TransactionTextStyles.categoryTextStyle,
              ),
              Text(
                transaction.description,
                style: TransactionTextStyles.descriptionTextStyle,
              ),
            ],
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transaction.amount.toString(),
                style: TransactionTextStyles.amountTextStyle(
                    transaction.isExpense),
              ),
              Text(
                DateTimeFormat.formatDateTime(transaction.dateTime),
                style: TransactionTextStyles.dateTimeTextStyle,
              ),
            ],
          )),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
