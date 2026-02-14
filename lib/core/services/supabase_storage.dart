import 'dart:io';

import 'package:fruits_apps_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices{

  static late Supabase _supabase;

  static initSupabase() async {
   _supabase = await Supabase.initialize(
    url: 'https://xmzqxvakresdhqodoxsq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhtenF4dmFrcmVzZGhxb2RveHNxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzEwNjgwOTQsImV4cCI6MjA4NjY0NDA5NH0.5Lrqr7Ry9mn3QdNV6kbqpItZ0EtnouHGH6-hgo6JbE4',
  );
  }
  @override
  Future<String> uploadFile(File file, String path) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
} 