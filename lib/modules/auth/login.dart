import 'package:flutter/material.dart';
import 'package:ivallytask/controllers/facebook_auth_controller.dart';
import 'package:ivallytask/layout/navigation_layout.dart';
import 'package:ivallytask/shared/constants/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FacebookAuthController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/logo_horizontal.png'),
              ),
            ),
            const SizedBox(
              height: 120.0,
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  provider.checkLogin().then((value) {
                    provider.doLogin().then((value){
                      navigateAndFinish(context,const BottomNavigationLayout());
                    });
                  });
                },
                child: const Text(
                  'الدخول باستخدام الفيسبوك',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
