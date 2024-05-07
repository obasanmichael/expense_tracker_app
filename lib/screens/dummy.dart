import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add a new Expense'),
        addHeight(2),
        TextField(
          decoration: const InputDecoration(label: Text('Title')),
        ),
        addHeight(3),
        Text('Add an amount'),
        TextField(decoration: InputDecoration(label: Text('Amount')))
      ],
    );
  }
}
