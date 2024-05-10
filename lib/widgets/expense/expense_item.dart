import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      horizontalTitleGap: 20,
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: categoryData[expense.category]!.backgroundColor,
            borderRadius: BorderRadius.circular(14.r)),
        child: Center(
          child: Text(
            categoryData[expense.category]!.emoji,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expense.title,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 8),
        ],
      ),
      subtitle: Text(expense.formattedDate),
      trailing: Text(
        '-#${expense.amount.toStringAsFixed(2)}',
        style: TextStyle(color: Colors.red.shade600, fontSize: 16),
      ),
      tileColor: Colors.transparent,
    );
  }
}
