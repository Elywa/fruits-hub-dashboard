import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo.dart';
import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo_impl.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo.dart';
import 'package:fruits_hub_dash_board/core/repos/product%20repo/product_repo_impl.dart';
import 'package:fruits_hub_dash_board/core/services/data_base_service.dart';
import 'package:fruits_hub_dash_board/core/services/fire_store_service.dart';
import 'package:fruits_hub_dash_board/core/services/storage_service.dart';
import 'package:fruits_hub_dash_board/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storageService: getIt<StorageService>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(dataBaseService: getIt<DataBaseService>()),
  );
}
