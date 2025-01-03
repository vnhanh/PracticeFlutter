import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDiModule {
  @preResolve
  Future<Dio> get dio async => Dio();
}
