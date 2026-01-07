import 'package:fruits_apps_dashboard/core/services/fire_storage.dart';
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<StorageServices>(FireStorage());
}
