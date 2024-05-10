import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer(
      {super.key,
      required this.heading,
      required this.price,
      required this.bgColor});

  final String heading;
  final String price;
  final Color bgColor;

  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: bgColor),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(heading, style: TextStyle(fontSize: 10)),
              addWidth(0),
              Icon(
                Icons.chevron_right,
                size: 12,
              )
            ],
          ),
          Spacer(),
          Text(
            '#${price}',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.sp),
          )
        ],
      ),
    );
  }
}
