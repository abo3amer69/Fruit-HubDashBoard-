import 'package:flutter/material.dart';
import 'package:fruits_apps_dashboard/core/helper_function/on_generate_routes.dart';
import 'package:fruits_apps_dashboard/features/dashboard/views/dashboard_view.dart';

void main() {
  runApp(const FruitHupDashBoard());
}
class FruitHupDashBoard extends StatelessWidget {
  const FruitHupDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoutes,
    );
  }
}