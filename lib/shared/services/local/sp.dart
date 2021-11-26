import 'package:ivallytask/shared/di/di.dart';

import 'cache_helper.dart';

// this for save usertoken in shared pref
Future<bool> setUserTokenToShared({required String token}) async
{
  return await di<CacheHelper>().put('token', token);
}
// this for get usertoken in shared pref
Future<dynamic> getUserToken() async
{
  return await di<CacheHelper>().get('token');
}
// this for delete usertoken in shared pref
Future<bool> deleteUserToken() async
{
  return await di<CacheHelper>().clear('token');
}