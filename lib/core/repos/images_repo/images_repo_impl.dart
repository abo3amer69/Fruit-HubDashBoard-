import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_apps_dashboard/core/errors/failures.dart';
import 'package:fruits_apps_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo{
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
} 