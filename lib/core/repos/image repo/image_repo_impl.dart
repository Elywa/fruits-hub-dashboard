import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dash_board/core/repos/image%20repo/image_repo.dart';
import 'package:fruits_hub_dash_board/errors/failures.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failures, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
