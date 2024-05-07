import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.black,
      ),
    );
  }
}
