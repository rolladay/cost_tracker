import 'package:cost_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;
  //expense 객체는 받는단말야...?

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleMedium,),

            const SizedBox(
              height: 4.0,
            ),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(children: [
                  Icon(
                    categoryIcons[expense.category],
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    expense.getFormattedDate(),
                  ),
                ]),
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
