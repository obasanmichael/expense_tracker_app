import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
      onPressed: () {},
      child: Text(
        'food',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14.sp),
      ),
    );
  }
}
