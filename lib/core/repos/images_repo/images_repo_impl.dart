import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_apps_dashboard/core/errors/failures.dart';
import 'package:fruits_apps_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:fruits_apps_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl(this.storageServices);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageServices.uploadFile(
        image,
        BackendEndpoint.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('failed to upload image'));
    }
  }
}
