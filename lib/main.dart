import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dash_board/core/functions/routing.dart';
import 'package:fruits_hub_dash_board/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub_dash_board/core/services/get_it_service.dart';
import 'package:fruits_hub_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dash_board/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
