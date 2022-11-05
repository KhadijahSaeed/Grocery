import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_apps1/log_in.dart';
import 'package:my_apps1/sign_up.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
    home:LoginView(),

  )
  );
  

}