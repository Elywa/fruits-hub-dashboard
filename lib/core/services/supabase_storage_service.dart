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
    String fileName = b.basename(file.path);
    String fileExtension = b.extension(file.path);

    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName$fileExtension', file);
    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName$fileExtension');
    return result;
  }

  static createBucket(String bucketName) async {
    bool isBucketExist = false;
    var buckets = await _supabase.client.storage.listBuckets();
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      // Create the bucket if it does not exist
      await _supabase.client.storage.createBucket(bucketName);
    }
  }
}
