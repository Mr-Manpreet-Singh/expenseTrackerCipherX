import 'package:expense_tracker_app/screens/home_screen/home_screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/transaction_widgets/transaction_list.dart';
import 'package:expense_tracker_app/utils/bottom_navigation_bar.dart';
import 'package:expense_tracker_app/transaction_widgets/transaction_filters.dart';
import 'package:expense_tracker_app/screens/home_screen/home_screen_expense_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print("Rebuilding HOME.....");
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Column(
        children: [
          const HomeScreenExpenseContainer(),

          const SizedBox(height: 10),
          const TransactionFilters(), //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenHelper.recentTransactionTextBox,
              ElevatedButton(onPressed: () {}, child: const Text("See All")),
            ],
          ),
          const Expanded(child: TransactionList()),
        ],
      ),
      floatingActionButton: HomeScreenHelper.myFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
