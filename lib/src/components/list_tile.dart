import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      horizontalTitleGap: 20,
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(14.r)),
        child: const Center(
          child: Text(
            '🥦',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grocery',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 8), 
        ],
      ),
      subtitle: Text('June 12, 2022, Saturday'),
      trailing: Text(
        '-#120.00',
        style: TextStyle(color: Colors.red.shade600, fontSize: 16),
      ),
      tileColor: Colors.transparent,
    );
  }
}
