import 'package:flutter/material.dart';

class TransactionFilters extends StatelessWidget {
  const TransactionFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Today")),
        ElevatedButton(onPressed: () {}, child: const Text("Week")),
        ElevatedButton(onPressed: () {}, child: const Text("Month")),
        ElevatedButton(onPressed: () {}, child: const Text("Year")),
      ],
    );
  }
}
