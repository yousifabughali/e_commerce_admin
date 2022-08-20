
import 'package:e_commerce_admin/app_router/router.dart';
import 'package:e_commerce_admin/provider/firestore_provider.dart';
import 'package:e_commerce_admin/screens/lunch_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/category_screens/categories_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FireStoreProvider>(
            create: (context)=>FireStoreProvider(),
          ),
        ],
    child: MaterialApp(
      navigatorKey: AppRouter.navKey,
      home: HomeScreen(),
      ),
    );
  }
}
