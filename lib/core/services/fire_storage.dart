import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var fileReferances = storageReference.child(
      '$path/$fileName.$extensionName',
    );
    await fileReferances.putFile(file);
    var fileUrl = fileReferances.getDownloadURL();
    return fileUrl;
  }
}
