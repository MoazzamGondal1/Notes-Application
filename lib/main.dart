import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/Screens/wrapper.dart';
import 'package:notes/services/auth.dart';
import 'package:provider/provider.dart';
import 'Models/MyUser.dart';
import 'Screens/Home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<My_User?>.value(
      initialData: null,
      catchError: (_, __) => null,
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

