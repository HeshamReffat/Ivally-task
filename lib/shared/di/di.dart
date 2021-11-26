import 'package:get_it/get_it.dart';
import 'package:ivallytask/controllers/facebook_auth_controller.dart';
import 'package:ivallytask/controllers/lowest_price_controller.dart';
import 'package:ivallytask/controllers/navigation_layout_controller.dart';
import 'package:ivallytask/controllers/recent_controller.dart';
import 'package:ivallytask/shared/services/local/cache_helper.dart';
import 'package:ivallytask/shared/services/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

// di class to get one object from classes for more performance
//////////////////////////////////////////////////////////////////
GetIt di = GetIt.I..allowReassignment = true;

Future init() async {
  final sp = await SharedPreferences.getInstance();

  di.registerFactory<SharedPreferences>(
        () => sp,
  );
  di.registerFactory<CacheHelper>(
        () => CacheImplementation(
      di<SharedPreferences>(),
    ),
  );
  di.registerFactory<DioHelper>(
        () => DioImplementation(),
  );
  di.registerFactory<NavigationController>(
    () => NavigationController(),
  );
  di.registerFactory<FacebookAuthController>(
    () => FacebookAuthController(),
  );
  di.registerFactory<LowestPriceController>(
    () => LowestPriceController(dioHelper: di<DioHelper>(),),
  );
  di.registerFactory<RecentController>(
    () => RecentController(dioHelper: di<DioHelper>(),),
  );
}
