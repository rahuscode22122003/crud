import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:collectionapp/screens/accounts.dart';
import 'package:collectionapp/screens/collection.dart';
import 'package:collectionapp/screens/credit.dart';
import 'package:collectionapp/screens/homescreen.dart';
import 'package:collectionapp/screens/member/memberpage.dart';
import 'package:collectionapp/screens/nousers/nouser2.dart';
import 'package:collectionapp/screens/nousers/nousers.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:collectionapp/navbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homescreen(user: null,),
    );
  }
}
