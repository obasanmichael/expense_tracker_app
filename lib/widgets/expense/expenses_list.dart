import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expense/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDelete});

  final List<Expense> expenses;
  final void Function(Expense expense) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) =>
            ExpenseItem(onDelete: onDelete, expense: expenses[index]));
  }
}
