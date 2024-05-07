import 'package:expense_tracker_app/src/components/app_bar.dart';
import 'package:expense_tracker_app/src/components/persistent_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [MyAppBar()],
            ),
          ),
        ),
      ),
    );
  }
}
