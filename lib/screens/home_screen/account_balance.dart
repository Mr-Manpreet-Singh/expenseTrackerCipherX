import 'package:expense_tracker_app/providers/account_details_provider.dart';
import 'package:expense_tracker_app/screens/home_screen/home_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
                
    
    return Column(
      children: [
        const SizedBox(height: 10),
        HomeScreenHelper.accountBalanceTextBox,
        Consumer<AccountDetailsProvider>(
            builder: (context, value, child) {
              
              return Text(
                  value.accountDetails.accountBalance.toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: HomeScreenHelper.accountBalanceTextStyle,
                );
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
