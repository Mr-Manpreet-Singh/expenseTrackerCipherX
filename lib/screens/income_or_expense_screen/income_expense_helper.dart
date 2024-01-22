import 'package:expense_tracker_app/utils/custom_textstyle.dart';
import 'package:flutter/material.dart';

abstract class IncomeExpenseHelper {

// Text Box

  static Text howMuchTextBox = Text(
    'How much?',
    style: CustomTextStyles.customStyle(
      color: const Color.fromARGB(170, 251, 251, 251),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  // AppBar

  static AppBar myAppBar(BuildContext context, isExpenseScreen) {
    return AppBar(
      forceMaterialTransparency: true,
      title: Text(isExpenseScreen ? "Expense" : "Income"),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
    );
  }
}
