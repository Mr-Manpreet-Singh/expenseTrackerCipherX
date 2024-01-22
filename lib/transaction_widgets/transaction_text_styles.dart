import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';

abstract class TransactionTextStyles {
  static final categoryTextStyle = CustomTextStyles.customStyle(
    color: const Color(0xFF292B2D),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final descriptionTextStyle = CustomTextStyles.customStyle(
    color: const Color(0xFF90909F),
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle amountTextStyle(bool isExpense) {
    return CustomTextStyles.customStyle(
      color: isExpense ? const Color(0xFFFD3C4A) : const Color(0xFF00A86B),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static final dateTimeTextStyle = CustomTextStyles.customStyle(
    color: const Color(0xFF90909F),
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}
