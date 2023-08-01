import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zilmoney_task/controller/provider/login_provider.dart';
import 'package:zilmoney_task/model/login_model.dart';
import 'package:zilmoney_task/view/loginscreen/login_screen.dart';

void main()async {
await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(LoginModelAdapter().typeId)) {
    Hive.registerAdapter(LoginModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider())
        ],
        child: MaterialApp(
          title: 'Zilmoney Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
          ),
          home:  LoginScreen(),
        ));
  }
}
