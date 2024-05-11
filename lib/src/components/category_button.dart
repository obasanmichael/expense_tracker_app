import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.category, required this.onPressed});

  final Category category;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              backgroundColor: Colors.transparent,
              side: BorderSide(
                color: Colors.grey.shade400,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
              foregroundColor: Colors.grey.shade700),
          onPressed: onPressed,
          child: Text(
            category.toString().split('.').last,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}
