import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/provider/amounts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_formatter/money_formatter.dart';

class AmountContainer extends ConsumerWidget {
  const AmountContainer({
    Key? key,
    required this.heading,
    required this.bgColor,
    required this.registeredExpense,
  }) : super(key: key);

  final String heading;
  final Color bgColor;
  final List<Expense> registeredExpense;

  double calculateTotalExpenses() {
    double total = 0.0;
    for (var expense in registeredExpense) {
      total += expense.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double totalPrice = calculateTotalExpenses();
    ref.watch(totalExpensesProvider.notifier).state = totalPrice;
    MoneyFormatterOutput result = MoneyFormatter(
      amount: totalPrice,
      settings: MoneyFormatterSettings(
          symbol: '₦', thousandSeparator: ',', fractionDigits: 2),
    ).output;
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: bgColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(heading, style: TextStyle(fontSize: 10)),
              SizedBox(width: 0),
              Icon(
                Icons.chevron_right,
                size: 12,
              ),
            ],
          ),
          Spacer(),
          Text(
            result.symbolOnLeft,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.sp),
          ),
        ],
      ),
    );
  }
}
