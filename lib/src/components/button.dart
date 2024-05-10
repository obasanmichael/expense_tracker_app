import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.function,
  });

  final String text;
  final Color? backgroundColor;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    Color defaultColor = Color(0xffE97451);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            backgroundColor: defaultColor ?? backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.symmetric(vertical: 12.h)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
