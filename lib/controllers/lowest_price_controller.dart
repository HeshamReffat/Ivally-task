import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ivallytask/models/LowestPriceModel/lowest_price_model.dart';
import 'package:ivallytask/shared/services/remote/dio_helper.dart';
import 'package:ivallytask/shared/services/remote/end_points.dart';

class LowestPriceController with ChangeNotifier {
  late final DioHelper dioHelper; // Dio Object to access its functions
  late LowestPriceModel lowestPriceModel; // Data Model Object
  List<LowestPriceModel> lowestData = []; // List For the Model Components to get index
  Map<int, bool> fav = {};// map for get ids

  LowestPriceController({required this.dioHelper});

//Get Data Function from webService
  Future fetchData() async {
    lowestData.clear();
    return await dioHelper
        .getData(url: LOWESTPRICE, data: {'page': '1'}).then((value) {
      List data = [];
      data = value.data;
      for (var element in data) {
        lowestPriceModel = LowestPriceModel.fromJson(element);
        lowestData.add(lowestPriceModel);
        fav.addAll({lowestPriceModel.id: false});
      }
      //print(fav);
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
