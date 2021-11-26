import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivallytask/shared/constants/constants.dart';
import 'package:ivallytask/shared/services/local/sp.dart';

class FacebookAuthController with ChangeNotifier {
// Facebook Login check Function
  Future checkLogin() async {
    await FacebookAuth.instance.accessToken.then((value) {
      if(value != null) {
        Fluttertoast.showToast(msg: 'you are already signed in..');
        setUserTokenToShared(token: value.token);
      }
    });
    notifyListeners();
  }
// Facebook Login Function
  Future<void> doLogin() async {
    if (accessToken == null) {
      final LoginResult result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile
      if (result.status == LoginStatus.success) {
        print('you are logged');
        print(result.accessToken!.token);
        setUserTokenToShared(token: result.accessToken!.token);
      } else {
        print(result.status);
        print(result.message);
      }
      notifyListeners();
    }
  }
// Facebook Logout Function
  Future<void> doLogout() async {
    await FacebookAuth.instance.logOut();
    deleteUserToken();
    notifyListeners();
  }
}
