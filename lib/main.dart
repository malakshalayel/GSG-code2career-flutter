import 'package:e_commerce_design1/screens/home/fralancer_details.dart';
import 'package:e_commerce_design1/screens/home/home_screen.dart';
import 'package:e_commerce_design1/screens/note/data/notes_shared_db.dart';
import 'package:e_commerce_design1/screens/note/data/notes_sqlite_db.dart';
import 'package:e_commerce_design1/screens/note/presentation/screens/notes.dart';
import 'package:e_commerce_design1/screens/signup.dart';
import 'package:flutter/material.dart';
import 'core/routes.dart';
import 'screens/home2/home2_screen.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesSharedDb.init();
  await NotesSqliteDb.init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (context) => Login(),
        Routes.signup: (context) => Signup(),
        Routes.home: (context) => Home(),
        Routes.home2: (context) => Home2Screen(),
        Routes.freelancerDetails: (context) => FreelancerDetails(),
      },
      home: NotesScreen(),
    ),
  );
}
