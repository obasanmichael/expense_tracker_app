import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(height: width.w);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              style: TextStyle(fontSize: 13.sp),
            ),
            addHeight(2),
            Text(
              'Tolulope Obasan',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
              iconSize: 30,
            ),
            addWidth(20),
            CircleAvatar(
              child: Icon(Icons.person),
              radius: 30,
              backgroundColor: Colors.orange.shade700,
            )
          ],
        )
      ],
    );
  }
}
