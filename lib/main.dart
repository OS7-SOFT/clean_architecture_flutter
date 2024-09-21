import 'package:flutter/material.dart';
import 'package:frontend/features/Posts/presentation/providers/post_provider.dart';
import 'package:frontend/features/Posts/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:frontend/features/Posts/dependency_injection_.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PostProvider(),
        child: MaterialApp(
            home: Builder(builder: (context) {
              return const HomeScreen();
            }),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "OpenSans",
            )));
  }
}
