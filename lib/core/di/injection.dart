import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

// final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(getIt);
