
import 'package:casheir_mobill/Cuibt/cuibt.dart';
import 'package:casheir_mobill/SpalshScreen/Spalsh.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SheredPrefrence/shered.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await sherdprefrence.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(

      child: MultiBlocProvider(
        providers: [
       BlocProvider(create: (BuildContext context) => MobilCuibt())
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.brown,
            visualDensity: VisualDensity.adaptivePlatformDensity,

          ),
  debugShowCheckedModeBanner: false,
          home: Spalsh(),
        ),
      ),
    );
  }
}






