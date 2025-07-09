import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:fruits_hub_dash_board/core/services/storage_service.dart';
import 'package:fruits_hub_dash_board/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static initSupabaseStorageService() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    var fileExtension = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName$fileExtension', file);

    return result;
  }
}
