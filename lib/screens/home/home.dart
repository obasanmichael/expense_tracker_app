import 'package:expense_tracker_app/src/components/amount_container.dart';
import 'package:expense_tracker_app/src/components/app_bar.dart';
import 'package:expense_tracker_app/src/components/expenses_chart.dart';
import 'package:expense_tracker_app/src/components/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                MyAppBar(),
                addHeight(25),
                Row(
                  children: [
                    Expanded(child: AmountContainer()),
                    // Spacer(),
                    addWidth(15),
                    Expanded(child: AmountContainer()),
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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      MyListTile(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
