import 'dart:io';

import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense, required this.onDelete});

  final Expense expense;
  final void Function(Expense expense) onDelete;

  String getCurrency() {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format.currencySymbol;
  }

  String formatAmount(double amount) {
    MoneyFormatterOutput result = MoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
          symbol: '₦', thousandSeparator: ',', fractionDigits: 2),
    ).output;

    return result.symbolOnLeft;
  }

  @override
  Widget build(BuildContext context) {
    String formattedAmount = formatAmount(expense.amount);
    return InkWell(
      onLongPress: () => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Do you want to delete this expense?'),
                backgroundColor: Colors.white,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      Future.delayed(Duration.zero, () {
                        onDelete(expense);
                      });
                    },
                    child: Text('Yes'),
                  ),
                ],
              )),
      child: ListTile(
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
          '-$formattedAmount',
          style: TextStyle(color: Colors.red.shade600, fontSize: 16),
        ),
        tileColor: Colors.transparent,
      ),
    );
  }
}
