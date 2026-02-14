import 'package:fruits_apps_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_apps_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_apps_dashboard/core/repos/product_repo.dart/product_repo.dart';
import 'package:fruits_apps_dashboard/core/repos/product_repo.dart/product_repo_impl.dart';
import 'package:fruits_apps_dashboard/core/services/database_services.dart';
import 'package:fruits_apps_dashboard/core/services/fire_storage.dart';
import 'package:fruits_apps_dashboard/core/services/firestore_services.dart';
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:fruits_apps_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<StorageServices>(SupabaseStorageServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StorageServices>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt.get<DatabaseServices>()),
  );
}
