import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo.dart';
import 'package:fruits_hub_dash_board/core/services/storage_service.dart';
import 'package:fruits_hub_dash_board/core/utils/constants.dart';
import 'package:fruits_hub_dash_board/errors/failures.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;
  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      final imageUrl = await storageService.uploadFile(image, kImageUrl);
      return right(imageUrl);
    } catch (e) {
      debugPrint(
        "------------------- Error uploading image: $e ---------------------",
      );
      return left(ServerFailure("Upload image failed: $e"));
    }
  }
}
