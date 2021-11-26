import 'package:flutter/cupertino.dart';
import 'package:ivallytask/modules/home/home.dart';
import 'package:ivallytask/modules/settings/settings.dart';

class NavigationController with ChangeNotifier {
  int layoutIndex = 0; // index variable

  //NavBar Widget List
  List<Widget> screens = [
    const HomeScreen(),
    const SettingsScreen(),
  ];

//Function To Change The index in Widget LIst
  void changeLayoutIndex(index) {
    layoutIndex = index;
    notifyListeners();
  }
}
