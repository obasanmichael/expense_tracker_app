import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/provider/amounts_provider.dart';
import 'package:expense_tracker_app/provider/salary_provider.dart';
import 'package:expense_tracker_app/src/components/amount_container.dart';
import 'package:expense_tracker_app/src/components/app_bar.dart';
import 'package:expense_tracker_app/src/components/earnings_container.dart';
import 'package:expense_tracker_app/src/components/expenses_chart/expenses_chart.dart';
import 'package:expense_tracker_app/widgets/expense/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.registeredExpense});

  final List<Expense> registeredExpense;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget addHeight(double height) => SizedBox(height: height.h);

  Widget addWidth(double width) => SizedBox(width: width.w);
  bool hasAcknowledgedAlert = false;

  void onDelete(Expense expense) {
    setState(() {
      widget.registeredExpense.remove(expense);
      // Navigator.pop(context);
    });
  }

  void showExpenseAlert(BuildContext context, VoidCallback onYesPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Expenses Exceeded Salary'),
          content: Text(
              'Your total expenses have exceeded your salary. Do you want to continue?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                onYesPressed(); // Execute the callback
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (totalExpense > salary && !hasAcknowledgedAlert) {
    //     showExpenseAlert(context, () {
    //       setState(() {
    //         hasAcknowledgedAlert = true;
    //       });
    //     });
    //   }
    // });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(),
              addHeight(25),
              Row(
                children: [
                  Expanded(
                      child: EarningsContainer(
                    heading: 'Earnings this month',
                    bgColor: Colors.green.shade100,
                  )),
                  // Spacer(),
                  addWidth(15),
                  Expanded(
                      child: AmountContainer(
                    registeredExpense: widget.registeredExpense,
                    heading: 'Expenses so far',
                    bgColor: Color(0xffF4C2C2),
                  )),
                ],
              ),
              addHeight(20),
              ExpensesChart(),
              addHeight(20),
              widget.registeredExpense.length != 0
                  ? Row(
                      children: [
                        Text(
                            'Last ${widget.registeredExpense.length} transaction(s)',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 12.sp)),
                        Spacer(),
                        Text('view all'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You have yet to make any transactions.',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 15.sp),
                          textAlign: TextAlign.left,
                        ),
                        addHeight(2),
                        Text(
                          'Click on the add button below to add an expense',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
              addHeight(15),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ExpensesList(
                          onDelete: (expense) {
                            Future.microtask(() {
                              setState(() {
                                widget.registeredExpense.remove(expense);
                              });
                            });
                          },
                          expenses: widget.registeredExpense),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
