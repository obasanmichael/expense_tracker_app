import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/src/components/button.dart';
import 'package:expense_tracker_app/src/components/category_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);
  DateTime? _selectedDate;
  late bool isDatePicked;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.day, now.month, now.year - 1);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
          addHeight(10),
          Text(
            'Add a new Expense',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.grey.shade600),
          ),
          addHeight(2),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10.r)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
              labelText: 'Title',
              // hintText: '',
            ),
          ),
          addHeight(25),
          // Text(
          //   'Add an amount',
          //   style: TextStyle(
          //       fontWeight: FontWeight.w700, color: Colors.grey.shade600),
          // ),
          addHeight(5),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.r)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    labelText: 'Amount',
                    hintText: 'Enter your Amount',
                  ),
                ),
              ),
              addWidth(5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? 'Pick a date'
                        : myFormatter.format(_selectedDate!)),
                    addWidth(0),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month_outlined))
                  ],
                ),
              ),
            ],
          ),
          addHeight(20),
          Text('Select a Category of expenses'),
          addHeight(10),
          CategoryButton(),
          Spacer(),
          Button(backgroundColor: null, text: 'Add expense')
        ],
      ),
    );
  }
}
