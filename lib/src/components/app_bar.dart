import 'package:expense_tracker_app/provider/name_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({super.key});
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(height: width.w);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fName = ref.watch(firstNameProvider);
    final lName = ref.watch(lastNameProvider);
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
              '${fName} ${lName}',
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
              backgroundColor: Color(0xffE97451),
            )
          ],
        )
      ],
    );
  }
}
