import 'dart:developer';

import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class WebApi {
  late Dio dio;
  WebApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      log('WebApi');
      return response.data;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
