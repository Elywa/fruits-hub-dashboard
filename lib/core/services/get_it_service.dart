import 'package:fruits_hub_dash_board/core/services/fire_storage_service.dart';
import 'package:fruits_hub_dash_board/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorageService());
}
