import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/src/components/button.dart';
import 'package:expense_tracker_app/src/components/category_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);
  Category? _selectedCategory;
  DateTime? _selectedDate;
  late bool isDatePicked;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim() == null ||
        amountIsValid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Ensure to enter valid amount, title, date and category.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text('Okay'))
                ],
              ));
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        date: _selectedDate!,
        amount: enteredAmount,
        category: _selectedCategory!,
      ),
    );
    Navigator.pop(context);
  }

  void _showCategory(Category pickedCategory) {
    // final pickedCategory = _categoryController;

    setState(() {
      _selectedCategory = pickedCategory;
      _categoryController.text = pickedCategory.toString().split('.').last;
    });
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.day, now.month, now.year - 1);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 25.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ),
            addHeight(10),
            Text(
              'Add a new Expense',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey.shade600),
            ),
            addHeight(7),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade800),
                    borderRadius: BorderRadius.circular(10.r)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.r)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                hintText: 'Enter a title',
                // hintText: '',
              ),
            ),
            addHeight(25),
            // Text(
            //   'Add an amount',
            //   style: TextStyle(
            //       fontWeight: FontWeight.w700, color: Colors.grey.shade600),
            // ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade800),
                          borderRadius: BorderRadius.circular(10.r)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
                      labelText: 'Amount',
                      prefixText: '₦ ',
                      prefixStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Enter your Amount',
                    ),
                  ),
                ),
                addWidth(5),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selectedDate == null
                          ? 'Pick a date'
                          : myFormatter.format(_selectedDate!)),
                      addWidth(0),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: Icon(Icons.calendar_month_outlined))
                    ],
                  ),
                ),
              ],
            ),
            addHeight(20),
            Row(
              children: [
                Expanded(child: Text('Select a Category')),
                addWidth(5),
                Expanded(
                  child: TextField(
                    controller: _categoryController,
                    readOnly: true,
                  ),
                )
              ],
            ),
            addHeight(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Category.values
                    .map((category) => CategoryButton(
                        onPressed: () => _showCategory(category),
                        category: category))
                    .toList(),
              ),
            ),
            addHeight(25),
            Row(
              children: [
                Expanded(
                    child: Button(
                        function: () => Navigator.pop(context),
                        backgroundColor: null,
                        text: 'Cancel')),
                addWidth(10),
                Expanded(
                    child: Button(
                        function: _submitExpense,
                        backgroundColor: null,
                        text: 'Add expense')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
