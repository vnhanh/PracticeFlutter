
import 'package:injectable/injectable.dart';

@singleton
// @Environment("dev")
class AppConfig {
  final String _baseUrl = "https://127.0.0.1";

  String get baseUrl => _baseUrl;
}
