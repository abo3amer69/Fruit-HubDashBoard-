import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';

class FireStorage implements StorageServices{

  final storageReference = FirebaseStorage.instance;
  @override
  Future<String> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

}