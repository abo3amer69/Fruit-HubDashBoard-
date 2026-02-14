import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_apps_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruits_apps_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_apps_dashboard/core/services/get_it_services.dart';
import 'package:fruits_apps_dashboard/core/services/supabase_storage.dart';
import 'package:fruits_apps_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_apps_dashboard/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

   await SupabaseStorageServices.initSupabase();
   await SupabaseStorageServices.creatBucket('fruits-images');
  Bloc.observer=CustomBlocObserver();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpGetIt();
  runApp(const FruitHupDashBoard());
}
class FruitHupDashBoard extends StatelessWidget {
  const FruitHupDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}