import 'package:expense_tracker_app/src/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(
            'Add an amount',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.grey.shade600),
          ),
          addHeight(5),
          TextField(
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
          addHeight(10),
          Text('Select a Category of expenses'),
          Spacer(),
          Button(backgroundColor: null, text: 'Add expense')
        ],
      ),
    );
  }
}
