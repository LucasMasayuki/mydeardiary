import 'package:dio/dio.dart';
import 'package:mydeardiary/app/data/api/dio_client.dart';
import 'package:mydeardiary/app/infra/api/dio_adapter.dart';

DioClient makeHttpAdapter() => DioAdapter(Dio());
