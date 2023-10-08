import 'package:cost_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:cost_tracker/models/expense.dart';
import 'chart/chart.dart';
import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        category: Category.food,
        title: 'lessonFee',
        amount: 19.99,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cinema',
        amount: 8.75,
        date: DateTime.now()),
  ];

  void _addExpenseModal() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),

    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted!'),
        action: SnackBarAction(
            label: 'UnDo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('Write some item'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _addExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: width < 600
            ? Column(
                children: [
                  Chart(
                    expenses: _registeredExpenses,
                  ),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(
                      expenses: _registeredExpenses,
                    ),
                  ),
                  Expanded(child: mainContent),
                ],
              ),
      ),
    );
  }
}
