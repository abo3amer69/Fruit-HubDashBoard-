import 'dart:io';
import 'package:path/path.dart' as b;
import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static creatBucket(String bucketName) async {
    await _supabase.client.storage.createBucket(bucketName);
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://xmzqxvakresdhqodoxsq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhtenF4dmFrcmVzZGhxb2RveHNxIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTA2ODA5NCwiZXhwIjoyMDg2NjQ0MDk0fQ.l2yAdzqTCot8pCD4SxgmFB5H33XYJKydYoGj74Jc7NE',
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
  var result=  await _supabase.client.storage
        .from('fruits-images')
        .upload('$path/$fileName.$extensionName', file);

        return result;
  }
}
