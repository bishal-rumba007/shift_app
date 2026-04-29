import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shift_app/features/home/presentation/home_screen.dart';
import 'package:shift_app/firebase_options.dart';
import 'package:shift_app/shared/config/remote_config_service.dart';
import 'package:shift_app/shared/sdui/init_sdui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 🔥 Remote Config setup (data layer)
  final remoteConfig = FirebaseRemoteConfig.instance;
  final service = RemoteConfigService(remoteConfig);
  await service.init();
  await service.fetch();

  // 🧩 SDUI setup (UI registry)
  initSDUI();

  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
