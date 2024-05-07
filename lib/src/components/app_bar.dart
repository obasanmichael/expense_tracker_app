import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(height: width.h);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,'),
            addHeight(2),
            Text('Tolulope Obasan' style: TextStyle(fontS: ),),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
            CircleAvatar(child: Icon(Icons.person))
          ],
        )
      ],
    );
  }
}
