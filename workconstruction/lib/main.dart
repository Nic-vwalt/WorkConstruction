import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:workconstruction/classes/authentication_service.dart';
import 'package:workconstruction/screens/welcome/homepage.dart';
import 'package:workconstruction/screens/welcome/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workconstruction/screens/welcome/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: 'Work Construction',
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.yellow,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final String phoneNumber = firebaseUser.phoneNumber.toString();
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final Future<DocumentSnapshot> doc = users.doc(phoneNumber).get();

    if (firebaseUser != null) {
      if (doc != null) {
        return Homepage(phoneNumber);
      } else {
        return Register(phoneNumber);
      }
    }
    return Login();
  }
}
