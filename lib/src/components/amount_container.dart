import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key});

  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.green.shade100),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Earnings this month', style: TextStyle(fontSize: 12)),
              addWidth(0),
              Icon(Icons.arrow_right)
            ],
          ),
          Spacer(),
          Text(
            '#1,200.00',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.sp),
          )
        ],
      ),
    );
  }
}
