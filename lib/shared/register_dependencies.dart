import 'package:get_it/get_it.dart';
import 'package:random_number_generator/bloc/_bloc.dart';
import 'package:random_number_generator/data_sources/_data_sources.dart';
import 'package:random_number_generator/navigation/_navigation.dart';
import 'package:random_number_generator/repositories/api_platform.dart';

void registerDependencies() {
  GetIt.I.registerSingleton(SetupNavigator());
  GetIt.I.registerSingleton(ApiPlatform('https://www.random.org'));
  GetIt.I.registerSingleton(RandomNumberApi());
  GetIt.I.registerSingleton(RandomNumberBloc());
}

Future<void> resetAppSession() async {
  await GetIt.I.reset();
  registerDependencies();
}
