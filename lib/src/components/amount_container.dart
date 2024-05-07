import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key});

  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text('Earnings this month'),
              addWidth(1),
              Icon(Icons.arrow_right)
            ],
          ),
          Spacer(),
          Text('#1,200.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),)
        ],
      ),
    );
  }
}
