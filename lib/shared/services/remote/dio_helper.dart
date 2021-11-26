import 'package:dio/dio.dart';
import 'dart:async';

// dio helper class is for organizing the webservice method and to be shared on all project
abstract class DioHelper {
  Future<Response> postData({
    required String url,
    dynamic data,
    String token,
  });

  Future<Response> putData({
    required String url,
    required dynamic data,
    String token,
  });

  Future<Response> getData({
    required String url,
    dynamic data,
    String token
  });
  Future<Response> delete({
    required String url,
    String token,
  });
}

class DioImplementation extends DioHelper
{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://amlakalibaba.com/wp-json/ml/v1/',

      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<Response> postData({
    String? url,
    String? token,
    dynamic data,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };
    return await dio.post(
      url!,
      data: data,
    );
  }

  @override
  Future<Response> putData({
    String? url,
    dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };

    return await dio.put(
      url!,
      data: data,
    );
  }

  @override
  Future<Response> getData({
    String? url,
    dynamic data,
    String ?token
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };

    return await dio.get(
      url!,
      queryParameters: data,
    );
  }
  @override
  Future<Response> delete({String ?url, String ?token})async {
    dio.options.headers = {
      'Authorization': token,
    };

    return await dio.delete(url!,);

  }
}
//
// extension on DioHelper {
//   Future _request(Future<Response> request()) async {
//     try {
//       final r = await request.call();
//       return r.data;
//     } on DioError catch (e) {
//       throw ServerException(e.response.data);
//     } catch (e) {
//       throw Exception();
//     }
//   }
// }
