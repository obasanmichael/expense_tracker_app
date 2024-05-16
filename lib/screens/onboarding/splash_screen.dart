import 'package:expense_tracker_app/src/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget addHeight(double height) => SizedBox(height: height.h);
    Widget addWidth(double width) => SizedBox(width: width.w);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Row(
                children: [
                  Text(
                    'Take',
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  addWidth(10),
                  Text(
                    'command',
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: Color(0xffE97451),
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              addHeight(2),
              Text('over your expenses!',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  )),
              addHeight(5),
              Text(
                'Track, manage and work on all your expenses at one place',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade500),
              ),
              Spacer(),
              Button(
                  backgroundColor: null,
                  text: 'Get Started',
                  function: () {
                    context.go('/sign-up');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
