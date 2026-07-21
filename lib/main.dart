import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/di/app_dependencies.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final dependencies = AppDependencies.create();
  await dependencies.notificationService.initialize();
  runApp(MamaBusKoiApp(dependencies: dependencies));
}
