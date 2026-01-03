import 'package:flutter/material.dart';
import 'package:fruits_apps_dashboard/features/views/dashboard_view.dart';

Route onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

      
    default:
      return MaterialPageRoute(builder: (context) => const Placeholder());
  }
}
