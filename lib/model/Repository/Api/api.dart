import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
class API{
  Dio _dio = Dio();
  API(){
    _dio.options.baseUrl= 'https://jsonplaceholder.typicode.com';
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio  get sendRequest {return _dio;}
}
