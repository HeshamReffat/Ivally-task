import 'package:flutter/material.dart';
import 'package:ivallytask/controllers/facebook_auth_controller.dart';
import 'package:ivallytask/modules/auth/login.dart';
import 'package:ivallytask/shared/constants/constants.dart';
import 'package:provider/provider.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FacebookAuthController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Container(
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
              provider.doLogout().then((value) {
                navigateAndFinish(context,const LoginScreen());
              });
            },
            child: const Text(
              'تسجيل الخروج',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),),
      ],
    );
  }
}
