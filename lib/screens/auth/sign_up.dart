import 'package:expense_tracker_app/provider/name_provider.dart';
import 'package:expense_tracker_app/provider/salary_provider.dart';
import 'package:expense_tracker_app/src/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _salaryController = TextEditingController();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();

  @override
  void dispose() {
    _salaryController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget addHeight(double height) => SizedBox(height: height.h);
    Widget addWidth(double width) => SizedBox(width: width.w);
    ref.watch(SalaryProvider);
    ref.watch(firstNameProvider);
    ref.watch(lastNameProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            TextField(
              controller: _fNameController,
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
              controller: _lNameController,
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
              controller: _salaryController,
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
              text: 'Make an Expense',
              function: () {
                String fName = _fNameController.text;
                String lName = _lNameController.text;
                ref.read(firstNameProvider.notifier).state = fName;
                ref.read(lastNameProvider.notifier).state = lName;
                final salaryText = _salaryController.text
                    .trim()
                    .replaceAll('₦', '')
                    .replaceAll(',', '');
                double? salary = double.tryParse(salaryText);

                if (salary != null) {
                  ref.read(SalaryProvider.notifier).state = salary;

                  context.go('/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
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
