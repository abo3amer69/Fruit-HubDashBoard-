import 'package:flutter/material.dart';
import 'package:fruits_apps_dashboard/features/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardViewBody(),
    );
  }
}