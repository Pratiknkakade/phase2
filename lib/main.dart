import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phase2/Vendor/DisplayVendor.dart';
import 'package:phase2/Vendor/VendorProvider.dart';
import 'package:phase2/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VendorProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayVendor(),
    );
  }
}
