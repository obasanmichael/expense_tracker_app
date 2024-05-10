import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/src/components/amount_container.dart';
import 'package:expense_tracker_app/src/components/app_bar.dart';
import 'package:expense_tracker_app/src/components/expenses_chart/expenses_chart.dart';
import 'package:expense_tracker_app/widgets/expense/expense_item.dart';
import 'package:expense_tracker_app/widgets/expense/expenses_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Food',
        date: DateTime.now(),
        amount: 12000,
        category: Category.food),
    Expense(
        title: 'Movies',
        date: DateTime.now(),
        amount: 10000,
        category: Category.movies),
    Expense(
        title: 'medication',
        date: DateTime.now(),
        amount: 12000,
        category: Category.health)
  ];

  Widget addHeight(double height) => SizedBox(height: height.h);

  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MyAppBar(),
              addHeight(25),
              Row(
                children: [
                  Expanded(
                      child: AmountContainer(
                    heading: 'Earning this month',
                    bgColor: Colors.green.shade100,
                    price: '20,000',
                  )),
                  // Spacer(),
                  addWidth(15),
                  Expanded(
                      child: AmountContainer(
                    heading: 'Expenses this month',
                    bgColor: Color(0xffF4C2C2),
                    price: '10,000',
                  )),
                ],
              ),
              addHeight(20),
              ExpensesChart(),
              addHeight(20),
              Row(
                children: [
                  Text('Last 10 transactions',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 12.sp)),
                  Spacer(),
                  Text('view all'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black))
                ],
              ),
              addHeight(15),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: ExpensesList(expenses: _registeredExpense)),
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
