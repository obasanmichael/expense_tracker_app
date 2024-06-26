import 'package:expense_tracker_app/screens/auth/sign_up.dart';
import 'package:expense_tracker_app/screens/error_page.dart';
import 'package:expense_tracker_app/screens/onboarding/splash_screen.dart';
import 'package:expense_tracker_app/src/components/persistent_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

final GoRouter _router = GoRouter(
  initialLocation: '/',
  errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => SplashScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (BuildContext context, GoRouterState state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => PersistentNav(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'My Expense tracker',
          // home: PersistentNav(),
          theme: (ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily)),
        );
      },
    );
  }
}
