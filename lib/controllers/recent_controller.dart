import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivallytask/models/recentModel/recent_model.dart';
import 'package:ivallytask/shared/services/remote/dio_helper.dart';
import 'package:ivallytask/shared/services/remote/end_points.dart';

class RecentController with ChangeNotifier {
  late final DioHelper dioHelper; // Dio Object to access its functions
  late RecentModel recentModel; // Data Model Object
  List<RecentModel> recentData =
      []; // List For the Model Components to get index
  Map<int, bool> fav = {}; // map for get ids

  RecentController({required this.dioHelper});

//Get Data Function from webService
  Future fetchData() async {
    recentData.clear();
    return await dioHelper
        .getData(url: RECENTPRICE, data: {'page': '1'}).then((value) {
      List data = [];
      data = value.data;
      for (var element in data) {
        recentModel = RecentModel.fromJson(element);
        recentData.add(recentModel);
        fav.addAll({recentModel.id: false});
      }
      notifyListeners();
    }).catchError((error) {
      if (error is DioError) {
        Fluttertoast.showToast(msg: 'Connection Lost');
      }
      print(error.toString());
      notifyListeners();
    });
  }

// function to change favorite
  void setFav(id) {
    fav[id] = !fav[id]!;
    notifyListeners();
  }
}
