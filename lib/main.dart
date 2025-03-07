import 'package:expense_splitting_app/pages/home_page.dart';
import 'package:expense_splitting_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{

  await Hive.initFlutter();

  await Hive.openBox("groupbox");
  await Hive.openBox("friendbox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[1000],
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      routes: {
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
