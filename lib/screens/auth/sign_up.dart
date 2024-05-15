import 'package:expense_tracker_app/provider/salary_provider.dart';
import 'package:expense_tracker_app/src/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _salaryController = TextEditingController();
  double salary = 0;

  @override
  void dispose() {
    _salaryController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget addHeight(double height) => SizedBox(height: height.h);
    Widget addWidth(double width) => SizedBox(width: width.w);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(10.r)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                labelText: 'First Name',
                hintText: 'Enter your first Name',
              ),
            ),
            addHeight(15),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(10.r)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                labelText: 'Last Name',
                hintText: 'Enter your last Name',
              ),
            ),
            addHeight(15),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(10.r)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                labelText: 'Salary',
                hintText: 'Enter your salary',
                prefixText: '₦ ',
                prefixStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Spacer(),
            Button(
              backgroundColor: null,
              text: 'Make an Expense',
              function: () {
                final salaryText = _salaryController.text
                    .trim()
                    .replaceAll('₦', '')
                    .replaceAll(',', '');
                double? salary = double.tryParse(salaryText);

                if (salary != null) {
                  Provider.of<SalaryProvider>(context, listen: false)
                      .setSalary(salary);
                  context.go('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Please enter a valid salary amount')),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
