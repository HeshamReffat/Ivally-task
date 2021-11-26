
import 'package:flutter/material.dart';
import 'package:ivallytask/controllers/facebook_auth_controller.dart';
import 'package:ivallytask/controllers/lowest_price_controller.dart';
import 'package:ivallytask/controllers/navigation_layout_controller.dart';
import 'package:ivallytask/controllers/recent_controller.dart';
import 'package:ivallytask/modules/auth/login.dart';
import 'package:ivallytask/shared/constants/constants.dart';
import 'package:ivallytask/shared/di/di.dart';
import 'package:ivallytask/shared/services/local/sp.dart';
import 'package:provider/provider.dart';

import 'layout/navigation_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  accessToken = await getUserToken();

  print(accessToken);

  late Widget start;

  if (accessToken != null) {
    start = const BottomNavigationLayout();
  } else if (accessToken == null) {
    start = const LoginScreen();
  }
  runApp(MyApp(start: start));
}

class MyApp extends StatelessWidget {
  Widget start;

  MyApp({required this.start});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationController>(
            create: (_) => di<NavigationController>()),
        ChangeNotifierProvider<FacebookAuthController>(
            create: (_) => di<FacebookAuthController>()),
        ChangeNotifierProvider<LowestPriceController>(
            create: (_) => di<LowestPriceController>()),
        ChangeNotifierProvider<RecentController>(
            create: (_) => di<RecentController>()),
      ],
      child: MaterialApp(
        title: 'I-vally Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: start,
      ),
    );
  }
}
