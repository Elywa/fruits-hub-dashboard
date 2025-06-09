import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dash_board/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorageService implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    var fileExtension = b.extension(file.path);
    var fileRef = storageRef.child('$path/$fileName.$fileExtension');
    await fileRef.putFile(file);
    var fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
