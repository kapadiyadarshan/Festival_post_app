import 'package:festival_post/utils/routes_utils.dart';
import 'package:festival_post/views/screens/DetailsPage.dart';
import 'package:festival_post/views/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.DetailsPage: (context) => const DetailsPage(),
      },
    );
  }
}
