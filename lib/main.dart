import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_printer_manager/pos_printer_manager.dart';

import 'home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ensure printer profile is loaded
  await CapabilityProfile.ensureProfileLoaded();
  print("ensured");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}
