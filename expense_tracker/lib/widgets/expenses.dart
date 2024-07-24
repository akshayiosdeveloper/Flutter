import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/chart/chart_bar.dart';
import 'package:expense_tracker/widgets/widgets_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/widgets_list/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.29,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Dart Course',
        amount: 30.29,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'iOS Course',
        amount: 34.29,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addExpense));
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(
          'Expense deleted...',
        ),
        action: SnackBarAction(
            label: 'Undo',
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
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: removeExpense,
      );
    }
    return (Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tracker App!!'),
        // backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    ));
  }
}
