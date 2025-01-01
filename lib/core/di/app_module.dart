import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDiModule {
  @preResolve
  Dio get dio => Dio();
}
