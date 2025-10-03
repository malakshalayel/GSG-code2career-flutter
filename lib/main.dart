import 'package:e_commerce_design1/features/home/fralancer_details.dart';
import 'package:e_commerce_design1/features/home/home_screen.dart';
import 'package:e_commerce_design1/features/note/data/notes_shared_db.dart';
import 'package:e_commerce_design1/features/note/data/notes_sqlite_db.dart';
import 'package:e_commerce_design1/features/products/presentation/provider/cart_provider.dart';
import 'package:e_commerce_design1/features/products/presentation/screens/products_screen.dart';
import 'package:e_commerce_design1/features/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/routes.dart';
import 'features/home2/home2_screen.dart';
import 'features/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotesSharedDb.init();
  // await NotesSqliteDb.init();
  runApp(
    ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider()..fetchData(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.login: (context) => Login(),
          Routes.signup: (context) => Signup(),
          Routes.home: (context) => Home(),
          Routes.home2: (context) => Home2Screen(),
          Routes.freelancerDetails: (context) => FreelancerDetails(),
        },
        home: ProductsScreen(),
      ),
    ),
  );
}
