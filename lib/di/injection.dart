import 'package:get_it/get_it.dart';
import 'package:nine_gags/di/remote_module.dart';
import 'package:nine_gags/di/repository_module.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  await RemoteModule.init();
  await RepositoryModule.init();
}