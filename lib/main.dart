import 'package:expense_tracker_app/screens/home/home.dart';
import 'package:expense_tracker_app/src/components/persistent_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, child) {
        return const MaterialApp(
            title: 'My Expense tracker', home: PersistentNav());
      },
    );
  }
}
